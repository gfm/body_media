module BodyMedia
  module Step
    class Day
      attr_accessor :date

      def initialize(step_day = {})
        @day = step_day
        self.date = Date.parse(@day['date'])
      end

      def total_steps
        @day['totalSteps'] || 0
      end
    end
  end
end