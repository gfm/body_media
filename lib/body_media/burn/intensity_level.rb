require 'ostruct'

module BodyMedia
  module Burn
    class IntensityLevel < OpenStruct
      %w(total_calories total_minutes average_calories average_minutes).each do |m|
        define_method(m) { send(m.camelize(:lower)) || 0 }
      end
    end
  end
end