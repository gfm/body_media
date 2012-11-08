require "body_media/version"
require "body_media/client"

module BodyMedia
  class << self
    attr_accessor :consumer_key, :consumer_secret

    def configure
      yield self
      self
    end
  end
end