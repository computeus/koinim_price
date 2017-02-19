require "spec_helper"

describe KoinimPrice::Ticker do
  it "has API_URL equals to #{KoinimPrice::KOINIM_URL}ticker" do
    expect(KoinimPrice::Ticker::API_URL).to eq("#{KoinimPrice::KOINIM_URL}ticker")
  end

  context 'methods' do
    before do
      expect(HTTParty).to receive(:get).and_return(double('Response', success?: true, body: { buy: 3800, sell: 3750, volume: 35, avg: 3600, wavg: 3500, high: 4500, low: 3000 }.to_json))
      KoinimPrice::Ticker.refresh
    end

    describe '.buy_price' do
      it 'should return the current buy price' do
        expect(KoinimPrice::Ticker.buy_price).to eq(3800)
      end
    end

    describe '.sell_price' do
      it 'should return the current sell price' do
        expect(KoinimPrice::Ticker.sell_price).to eq(3750)
      end
    end

    describe '.volume' do
      it 'should return the current volume data' do
        expect(KoinimPrice::Ticker.volume).to eq(35)
      end
    end

    describe '.average_price' do
      it 'should return the current average price data' do
        expect(KoinimPrice::Ticker.average_price).to eq(3600)
      end
    end

    describe '.weighted_average_price' do
      it 'should return the current weighted average price data' do
        expect(KoinimPrice::Ticker.weighted_average_price).to eq(3500)
      end
    end

    describe '.highest' do
      it 'should return the current highest price data' do
        expect(KoinimPrice::Ticker.highest).to eq(4500)
      end
    end

    describe '.lowest' do
      it 'should return the current lowest price data' do
        expect(KoinimPrice::Ticker.lowest).to eq(3000)
      end
    end
  end
end
