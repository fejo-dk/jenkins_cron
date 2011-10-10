require 'active_support/all'

require 'jenkins'
require 'whenever'

require "jenkins_cron/version"

module JenkinsCron
  autoload :JobList,             'jenkins_cron/job_list'
  autoload :Job,                 'jenkins_cron/job'
  autoload :CommandLine,         'jenkins_cron/command_line'

  module   Output
    autoload :PeriodicalTrigger, 'jenkins_cron/output/periodical_trigger'
  end
end
