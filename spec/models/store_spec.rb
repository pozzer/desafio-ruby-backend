require 'rails_helper'

RSpec.describe Store, type: :model do
  
  
  
  describe 'associations' do
    it { should have_many(:transactions) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:owner_name) }
  end
  
  context "sums and total_balance" do 
    let!(:store){ create(:store)}
    let!(:input_transaction_1){ create(:transaction, store: store)}
    let!(:output_transaction_1){ create(:transaction, kind: 2, store: store, amount: 8.0)}
    let!(:transaction_2){ create(:transaction, store: store)}
    let!(:output_transaction_2){ create(:transaction, kind: 2, store: store, amount: 5.0)}
    describe '.outputs_sums' do
      
      it "return sum outputs transactions" do
        expect(store.outputs_sums).to eq(13.0)
      end
    end

    describe '.inputs_sums' do
      it "return sum outputs transactions" do
        expect(store.inputs_sums).to eq(20.0)
      end
    end

    describe '.total_sums' do
      it "return total sums transactions of input and output" do
        expect(store.total_sums).to eq(7.0)
      end
    end
  end

  

end
