require 'body_media/burn/day'
require 'body_media/burn/intensity'

module BodyMedia
  module Burn
    class Summary
      attr_accessor :start_date, :end_date
      def initialize(summary)
        @summary = summary
        self.start_date = Date.parse(@summary['startDate'])
        self.end_date = Date.parse(@summary['endDate'])

        @days = summary['days'].map {|summary_day| Day.new(summary_day)}
      end

      def total_calories
        @summary['totalCalories']
      end

      def average_calories
        @summary['averageCalories']
      end

      def intensity
        @intensity ||= BodyMedia::Burn::Intensity.new(@summary['intensity'])
      end

      def on(date)
        date = Date.parse(date) if date.is_a?(String)

        @days.find {|day| day.date == date} || Day.new('date' => date.to_s)
      end
    end
  end
end