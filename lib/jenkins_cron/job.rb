module JenkinsCron
  class Job < Whenever::Job
    attr_reader :group, :label

    def initialize(options = {})
      super

      @options[:output] = ''
      @group = @options[:group].try(:to_sym) || nil
      @name  = @options[:name]  || raise(ArgumentError.new("A name is required to create a job at Jenkins!"))
      @label = @options.fetch(:label, nil)
    end

    def name
      @name.parameterize
    end
  end
end
