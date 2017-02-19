require "spec_helper"

describe KoinimPrice::Orderbook do
  it "has API_URL equals to #{KoinimPrice::KOINIM_URL}orderbook" do
    expect(KoinimPrice::Orderbook::API_URL).to eq("#{KoinimPrice::KOINIM_URL}orderbook")
  end

  context 'methods' do
    before do
      expect(HTTParty).to receive(:get).and_return(double('Response', success?: true, body: { asks: [{ price: 3905.00000000, total: 11830.75000000, amount: 3.02963990 }, { price: 3910.00000000, total: 117.30000000, amount: 0.03000000 }], bids: [{ price: 3901.00000000, total: 8311.32000000, amount: 2.13055981 }, { price: 3885.25000000, total: 35924.65000000, amount: 9.24641812 }, { price: 3873.01000000, total: 292.37000000, amount: 0.07548686 }] }.to_json))
      KoinimPrice::Orderbook.refresh
    end

    describe '.asks' do
      it 'should return the current buy price' do
        expect(KoinimPrice::Orderbook.asks.count).to eq(2)
      end
    end

    describe '.bids' do
      it 'should return the current sell price' do
        expect(KoinimPrice::Orderbook.bids.count).to eq(3)
      end
    end
  end
end
