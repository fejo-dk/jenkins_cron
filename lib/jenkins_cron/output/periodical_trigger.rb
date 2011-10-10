module JenkinsCron
  module Output
    class PeriodicalTrigger < Whenever::Output::Cron
      def output
        {:time_spec => time_in_cron_syntax, :task => task}
      end
    end
  end
end
