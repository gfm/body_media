require 'body_media/burn/intensity_level'

module BodyMedia
  module Burn
    class Intensity
      def initialize(intensity)
        @intensity = intensity || {}
      end

      def average_mets
        @intensity['averageMets'] || 0
      end

      def moderate
        IntensityLevel.new(@intensity['moderate'])
      end

      def vigorous
        IntensityLevel.new(@intensity['vigorous'])
      end

      def sedentary
        IntensityLevel.new(@intensity['sedentary'])
      end
    end
  end
end