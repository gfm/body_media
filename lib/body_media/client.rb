require 'date_core'
require 'oauth'
require 'json'
require 'body_media/summary'

module BodyMedia
  class Client
    def initialize(token, secret)
      consumer = OAuth::Consumer.new(BodyMedia.consumer_key, BodyMedia.consumer_secret,
        { :site => "http://api.bodymedia.com",
          :scheme => :header
        })

      @access_token = OAuth::AccessToken.from_hash(consumer, {oauth_token: token, oauth_token_secret: secret})
    end

    def token
      @access_token
    end

    def summary(start_date, end_date = nil)
      end_date ||= start_date
      
      start_date = Date.parse(start_date) if start_date.is_a?(String)
      end_date = Date.parse(end_date) if end_date.is_a?(String)

      date_format = "%Y%m%d"
      
      response = token.get "/v2/json/summary/day/#{start_date.strftime(date_format)}/#{end_date.strftime(date_format)}?api_key=#{BodyMedia.consumer_key}"
      response_hash = JSON.parse(response.body)

      BodyMedia::Summary.new(response_hash)
    end
  end
end