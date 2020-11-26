require 'rails_helper'

describe CnabImport::Import do
  describe ".import" do
    let(:valid_cnab) { Rack::Test::UploadedFile.new(File.new(Rails.root.join("spec", "fixtures", "CNAB.txt"))) }
    let(:invalid_cnab) { Rack::Test::UploadedFile.new(File.new(Rails.root.join("spec", "fixtures", "INVALID_CNAB.txt")))}

    it 'imports new financial entries' do
      expect(CnabImport::Import.new(valid_cnab).call.count).to eq(21)
    end

    it 'imports new financial entries' do
      expect(CnabImport::Import.new(invalid_cnab).call.count).to eq(0)
    end

    it 'imports new financial entries' do
      expect(CnabImport::Import.new(invalid_cnab).call.errors).to eq(["0 - invalid date"])
    end
  end
end