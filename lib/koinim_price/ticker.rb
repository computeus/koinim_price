module KoinimPrice
  class Ticker
    require 'httparty'
    require 'json'

    API_URL = "#{KOINIM_URL}ticker"

    @response = nil

    def self.buy_price
      response['buy']
    end

    def self.sell_price
      response['sell']
    end

    def self.volume
      response['volume']
    end

    def self.average_price
      response['avg']
    end

    def self.weighted_average_price
      response['wavg']
    end

    def self.highest
      response['high']
    end

    def self.lowest
      response['low']
    end

    def self.refresh
      @response = nil
      response
      true
    end

    def self.response
      @response ||= JSON.parse(HTTParty.get(API_URL).body)
    end
  end
end
