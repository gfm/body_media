require 'body_media/consumption/summary'
require 'body_media/burn/summary'
require 'body_media/sleep/summary'
require 'body_media/step/summary'

module BodyMedia
  class Summary
    attr_accessor :last_sync, :start_date, :end_date

    def initialize(summary)
      @summary = summary

      self.last_sync = @summary['lastSync']
      self.start_date = Date.parse(@summary['startDate'])
      self.end_date = Date.parse(@summary['endDate'])

      # start_date.upto(end_date).each do |date|
      #   day = BodyMedia::Day.new(date)

      #   [:sleep, :consumption, :burn, :step].each do |service|
      #     data = summary[service.to_s.camelize(:lower)]['days'].find {|summary_day| Date.parse(summary_day['date']) == date}
      #     day.send(service).update(data)
    #   end

      #   @days << day
      # end
    end

    def date_range
      start_date..end_date
    end

    def sleep
      @sleep ||= BodyMedia::Sleep::Summary.new(@summary['sleep'])
    end

    def consumption
      @consumption ||= BodyMedia::Consumption::Summary.new(@summary['consumption'])
    end

    def burn
      @burn ||= BodyMedia::Burn::Summary.new(@summary['burn'])
    end

    def step
      @step ||= BodyMedia::Step::Summary.new(@summary['step'])
    end
  end
end