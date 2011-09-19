module JenkinsCron
  class Jobs

    class Job < Jenkins::JobConfigBuilder
      Jenkins::JobConfigBuilder.instance_methods(false).grep(/=$/).each do |setter|
        getter_name = setter.gsub(/=$/, '')
        define_method("#{getter_name}_with_param") do |*params|
          if param = params.first
            send(setter, param)
          else
            send("#{getter_name}_without_param")
          end
        end
        alias_method "#{getter_name}_without_param", getter_name
        alias_method getter_name, "#{getter_name}_with_param"
      end

      def initialize(&job_definition)
        super('none', &job_definition)
      end

      def steps(*params)
        if param = params.first
          self.steps = param
        else
          @steps.collect { |step| step.to_a.first }
        end
      end

      def shell(b, command)
        build_shell_step(b, command)
      end

    end

    class <<self
      def define(&block)
        @jobs ||= new
        @jobs.instance_eval(&block)
      end

      def size
        @jobs.size
      end

      def [](job_name)
        @jobs[job_name]
      end
    end

    def initialize
      @job_definitions = {}
    end

    def size
      @job_definitions.size
    end

    def [](job_name)
      @job_definitions[job_name]
    end

    def job(job_name, &job_definition)
      @job_definitions[job_name] = Job.new(&job_definition)
    end

  end
end
