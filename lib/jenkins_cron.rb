require 'active_support/all'

require 'jenkins'

require "jenkins_cron/version"
require 'jenkins_cron/jobs'

module JenkinsCron
  autoload :JobList,          'jenkins_cron/job_list'
  autoload :Job,              'jenkins_cron/job'
  autoload :CommandLine,      'jenkins_cron/command_line'

  module Output
    autoload :Jenkins,        'jenkins_cron/output/jenkins'
  end
end
