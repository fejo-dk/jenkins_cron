module JenkinsCron
  class Job < Whenever::Job
    attr_reader :group

    def initialize(options = {})
      super

      @options[:output] = ''
      @group = @options[:group].try(:to_sym) || nil
      @name  = @options[:name]  || raise(ArgumentError.new("A name is required to create a job at Jenkins!"))
    end

    def name
      @name.gsub(/\s+/, '-')
    end
  end
end
