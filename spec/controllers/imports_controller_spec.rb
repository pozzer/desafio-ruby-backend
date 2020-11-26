require 'rails_helper'

RSpec.describe ImportsController, type: :controller do
 
  describe 'POST #import' do
    context "Valid Cnab.txt" do 
      subject do
        params = {
            file: Rack::Test::UploadedFile.new(File.new(Rails.root.join("spec", "fixtures", "CNAB.txt")))
        }
        post :import, params: params
      end

      it 'imports new financial entries' do
        expect{ subject }.to change{ Transaction.count }.by(21)
      end
      it { should redirect_to(stores_path) }
    end
  

    context "Invalid Cnab.txt" do 
      subject do
        params = {
            file: Rack::Test::UploadedFile.new(File.new(Rails.root.join("spec", "fixtures", "INVALID_CNAB.txt")))
        }
        post :import, params: params
      end

      it 'Inform invalid CNAB files' do
        expect{ subject }.to change{ Transaction.count }.by(0)
      end
      it { should redirect_to(stores_path) }
    end
  end
end