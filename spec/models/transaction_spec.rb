require 'rails_helper'

RSpec.describe Transaction, type: :model do
  
  context 'constants' do
    it  "Returns inputs kind" do
      expect(Transaction::INPUTS_KINDS).to match_array([:debit, :credit, :loan_receipt, :sale, :ted, :doc])
    end

    it "Returns outputs kinds" do
      expect(Transaction::OUTPUTS_KINDS).to match_array([:boleto, :financing, :rental])
    end
  end
  
  context 'validations' do
    it { should validate_presence_of(:kind) }
    it { should validate_presence_of(:amount) }
    it { should validate_presence_of(:card_number) }
    it { should validate_presence_of(:document_number) }
    it { should validate_presence_of(:occurrence_at) }
  end

  context 'associations' do
    it { should belong_to(:store) }
  end
  
  context 'enuns' do
    it { should define_enum_for(:kind).
      with_values( debit: 1, boleto: 2, financing: 3, credit: 4, loan_receipt: 5, sale: 6, ted: 7, doc: 8, rental: 9) }
  end
  context "scopes" do 
    describe ".inputs" do 
      it "return transactions with inputs kinds" do
        expect(Transaction.inputs.to_sql).to eq Transaction.where(kind: [1, 4, 5, 6, 7, 8]).to_sql
      end
    end

    describe ".outputs" do 
      it "return transactions with outputs kinds" do
        expect(Transaction.outputs.to_sql).to eq Transaction.where(kind: [2, 3, 9]).to_sql
      end
    end
  end

  describe "#create_by_cnab" do
    let(:cnab) { CnabImport::Parser.new("3201903010000014200096206760174753****3153153453JOÃO MACEDO   BAR DO JOÃO       ")}
    let(:transaction) {Transaction.create_by_cnab(cnab)}
    
    it "return new transaction with cnab" do      
      expect{Transaction.create_by_cnab(cnab)}.to change{Transaction.count}.by(1)
    end
  end
    
  describe "#autosave_associated_records_for_store" do 
    let!(:store){ create(:store, name:"Feliphe Bar", owner_name: "Feliphe")}
    let!(:transaction_1){ build(:transaction, store: store)}    
    let!(:transaction_2){ build(:transaction, store: Store.new(name:"Teste 1", owner_name:"Owner Teste 1"))}    
    let!(:transaction_3){ build(:transaction, store:  Store.new(name:"Feliphe Bar", owner_name:"Feliphe"))}    

    it "Creates a new store if it doesn't exist with the same name" do
      expect{transaction_2.save}.to change{Store.count}.by(1)  
    end

    it "find the store that was found with the name" do
      transaction_1.save
      transaction_2.save
      expect(Store.where(name:"Feliphe Bar", owner_name:"Feliphe").count).to eq(1)
    end

  end


end
