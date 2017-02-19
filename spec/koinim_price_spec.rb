require "spec_helper"

describe KoinimPrice do
  it 'has a version number' do
    expect(KoinimPrice::VERSION).not_to be nil
  end

  it 'has KOINIM_URL equals to https://koinim.com/' do
    expect(KoinimPrice::KOINIM_URL).to eq('https://koinim.com/')
  end

  it 'has KOINIM_PRICE_UNIT equals to TRY' do
    expect(KoinimPrice::KOINIM_PRICE_UNIT).to eq('TRY')
  end

  describe '.buy_price' do
    it 'calls KoinimPrice::Ticker.buy_price' do
      expect(KoinimPrice::Ticker).to receive(:buy_price)
      KoinimPrice.buy_price
    end
  end

  describe '.sell_price' do
    it 'calls KoinimPrice::Ticker.sell_price' do
      expect(KoinimPrice::Ticker).to receive(:sell_price)
      KoinimPrice.sell_price
    end
  end
end
