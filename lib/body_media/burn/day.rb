require 'body_media/burn/intensity'

module BodyMedia
  module Burn
    class Day
      attr_accessor :date

      def initialize(burn_day = {})
        @day = burn_day
        self.date = Date.parse(@day['date'])
      end

      def total_calories
        @day['totalCalories'] || 0
      end

      def average_calories
        @day['averageCalories'] || 0
      end

      def intensity
        @intensity ||= BodyMedia::Burn::Intensity.new(@day['intensity'])
      end
    end
  end
end