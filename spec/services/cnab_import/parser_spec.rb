require 'rails_helper'

describe CnabImport::Parser do
  
  let(:parser) { CnabImport::Parser.new("3201903010000014200096206760174753****3153153453JOÃO MACEDO   BAR DO JOÃO       ")}

  describe ".amount" do
    it "return amount" do
      expect(parser.amount).to eq(14200)
    end
    it "return amount Integer" do
      expect(parser.amount.class).to eq(Integer)
    end
  end

  describe ".amount_to_f" do
    it "return amount_to_f" do
      expect(parser.amount_to_f).to eq(142.0)
    end
    
    it "returns a class of type Float" do
      expect(parser.amount_to_f.class).to eq(Float)
    end
  end
  
  describe ".year" do
    it "return year" do
      expect(parser.year).to eq(2019)
    end

    it "returns a class of type Integer" do
      expect(parser.year.class).to eq(Integer)
    end
  end

  describe ".month" do
    it "return month" do
      expect(parser.month).to eq(03)
    end
    it "returns a class of type Integer" do
      expect(parser.month.class).to eq(Integer)
    end
  end

  describe ".day" do
    it "return day" do
      expect(parser.day).to eq(01)
    end
    it "returns a class of type Integer" do
      expect(parser.day.class).to eq(Integer)
    end
  end

  describe ".hour" do
    it "return hour" do
      expect(parser.hours).to eq(15)
    end
    it "returns a class of type Integer" do
      expect(parser.hours.class).to eq(Integer)
    end
  end

  describe ".minutes" do
    it "return minutes" do
      expect(parser.minutes).to eq(34)
    end

    it "returns a class of type Integer" do
      expect(parser.day.class).to eq(Integer)
    end
  end

  describe ".seconds" do
    it "return seconds" do
      expect(parser.seconds).to eq(53)
    end

    it "returns a class of type Integer" do
      expect(parser.day.class).to eq(Integer)
    end
  end

  describe ".occurrence_at" do
    it "return occurrence_at" do
      expect(parser.occurrence_at).to eq(DateTime.new(2019, 03 ,01, 15, 34, 53, "-0300"))
    end
    
    it "returns a class of type DateTime" do
      expect(parser.occurrence_at.class).to eq(DateTime)
    end

    it "return UTC-3 time zone" do
      expect(parser.occurrence_at.zone).to eq("-03:00")
    end
  end

  describe ".cpf" do
    it "return cpf" do
      expect(parser.cpf).to eq("09620676017")
    end    
  end

  describe ".card_number" do
    it "return card_number" do
      expect(parser.card_number).to eq("4753****3153")
    end

    it "returns a class of type String" do
      expect(parser.card_number.class).to eq(String)
    end
  end

  describe ".kind" do
    it "return transaction kind" do
      expect(parser.kind).to eq(3)
    end

    it "returns a class of type Integer" do
      expect(parser.kind.class).to eq(Integer)
    end
  end

  describe ".owner_name" do
    it "return owner_name" do
      expect(parser.owner_name).to eq("JOÃO MACEDO")
    end

    it "returns a class of type String" do
      expect(parser.owner_name.class).to eq(String)
    end

    it "returns a owner_name with trailing whitespace removed." do
      expect(parser.owner_name.size).to eq(11)
    end
  end

  describe ".store_name" do
    it "return store_name" do
      expect(parser.store_name).to eq("BAR DO JOÃO")
    end

    it "returns a class of type String" do
      expect(parser.store_name.class).to eq(String)
    end

    it "returns a store_name with trailing whitespace removed." do
      expect(parser.store_name.size).to eq(11)
    end
  end


end