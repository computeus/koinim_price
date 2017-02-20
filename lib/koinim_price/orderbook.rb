module KoinimPrice
  class Orderbook
    require 'httparty'

    API_URL = "#{KOINIM_URL}orderbook"
    @response = nil

    def self.asks
      response['asks']
    end

    def self.bids
      response['bids']
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
