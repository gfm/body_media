require 'body_media/sleep/day'

module BodyMedia
  module Sleep
    class Summary
      attr_accessor :start_date, :end_date
      def initialize(summary)
        @summary = summary
        self.start_date = Date.parse(@summary['startDate'])
        self.end_date = Date.parse(@summary['endDate'])

        @days = summary['days'].map {|summary_day| Day.new(summary_day)}
      end

      def total_lying
        @summary['totalLying']
      end

      def total_sleep
        @summary['totalSleep']
      end

      def efficiency
        @summary['efficiency']
      end

      def average_lying
        @summary['averageLying']
      end

      def average_sleep
        @summary['averageSleep']
      end

      def on(date)
        date = Date.parse(date) if date.is_a?(String)

        @days.find {|day| day.date == date} || Day.new('date' => date.to_s)
      end
    end
  end
end
