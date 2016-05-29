module JenkinsCron
  class JobList < Whenever::JobList

    def initialize(options)
      @job_groups = {}
      super
    end

    def job_type(name, template)
      class_eval do
        define_method(name) do |task, *args|
          options = { :task => task, :template => template }
          options.merge!(args[0]) if args[0].is_a? Hash

          job = JenkinsCron::Job.new(@options.merge(@set_variables).merge(options))

          @jobs[job.group] ||= {}
          @job_groups[job.group] ||= []
          @jobs[job.group][@current_time_scope] ||= []
          @jobs[job.group][@current_time_scope] << job
          @job_groups[job.group] << job
        end
      end
    end

    def generate_jenkins_output
      puts "--> Using Jenkins at: #{@jenkins_host}:#{@jenkins_port}"
      Jenkins::Api.setup_base_url(:host => @jenkins_host, :port => @jenkins_port)

      @jobs.each do |group, jobs_by_time_scope|
        jobs_by_time_scope = { jobs_by_time_scope.keys.first => @job_groups[group] } if group

        jobs_by_time_scope.each do |time, jobs|
          jobs.each_with_index do |job, idx|
            JenkinsCron::Output::PeriodicalTrigger.output(time, job) do |cron|
              config = Jenkins::JobConfigBuilder.new(:none) do |c|
                if group
                  c.triggers = [{:class => :timer, :spec => cron[:time_spec]}] if idx == 0
                else
                  c.triggers = [{:class => :timer, :spec => cron[:time_spec]}]
                end
                c.publishers = []
                c.publishers << {:job_triggers => { :projects => [jobs[idx + 1].name], :on => "FAILURE" }} if group && jobs[idx + 1]
                c.publishers << {:mailer => ["developers@fejo.dk"]}
                c.steps      = [[:build_shell_step, (environment_variables + cron[:task]).strip]]
                c.log_rotate = { :days_to_keep => 14 }
              end

              if Jenkins::Api.job(job.name)
                print "--> Updating Job '#{job.name}' ... "
                Jenkins::Api.update_job(job.name, config)
                print "[DONE]"
                puts
              else
                print "--> Creating Job '#{job.name}' ... "
                Jenkins::Api.create_job(job.name, config)
                print "[DONE]"
                puts
              end
            end
          end
        end
      end
    end
  end
end
