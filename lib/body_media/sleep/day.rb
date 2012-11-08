module BodyMedia
  module Sleep
    class Day
      attr_accessor :date

      def initialize(sleep_day = {})
        @day = sleep_day
        self.date = Date.parse(@day['date'])
      end

      def total_lying
        @day['totalLying'] || 0
      end

      def total_sleep
        @day['totalSleep'] || 0
      end

      def efficiency
        @day['efficiency'] || 0
      end

      def average_lying
        @day['averageLying'] || 0
      end

      def average_sleep
        @day['averageSleep'] || 0
      end
    end
  end
end