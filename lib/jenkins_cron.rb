require 'jenkins'

require "jenkins_cron/version"
require 'jenkins_cron/jobs'

module JenkinsCron
  class <<self
    def reset_jobs!
    end
  end
end
