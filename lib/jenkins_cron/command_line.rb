module JenkinsCron
  class CommandLine < Whenever::CommandLine
    def run
      JenkinsCron::JobList.new(@options).generate_jenkins_output
    end
  end
end
