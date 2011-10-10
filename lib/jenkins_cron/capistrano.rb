Capistrano::Configuration.instance(:must_exist).load do
  _cset(:jenkins_roles)        { :cron }
  _cset(:jenkins_environment)  { fetch :rails_env, (fetch(:stage) || "production") }
  _cset(:jenkins_server)       { "jenkins_host=localhost&jenkins_port=8080" }
  _cset(:jenkins_flags)        { "--set 'environment=#{fetch :jenkins_environment}&#{fetch :jenkins_server}'" }

  after "deploy:symlink", "jenkins:update"

  namespace :jenkins do

    desc "Update the jenkins jobs defined in the schedule.rb"
    task :update do
      options = { :roles => fetch(:jenkins_roles) }

      if find_servers(options).any?
        run "cd #{current_path} && bundle exec jenkins_cron #{fetch :jenkins_flags}", options
      end
    end

  end
end
