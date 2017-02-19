require "koinim_price/version"

module KoinimPrice
  KOINIM_URL = 'https://koinim.com/'
  KOINIM_PRICE_UNIT = 'TRY'

  def self.buy_price
    Ticker.buy_price
  end

  def self.sell_price
    Ticker.sell_price
  end
end

require "koinim_price/ticker"
require "koinim_price/orderbook"
