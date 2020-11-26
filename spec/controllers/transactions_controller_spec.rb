require 'rails_helper'

RSpec.describe TransactionsController, type: :controller do
  describe 'GET index' do
    let!(:store){ create(:store)}
    let!(:transaction){ create(:transaction, store: store)}

    it 'renders store transactions' do
      get :index, params: { store_id: store.id }
      expect(assigns[:transactions].count ).to eq(1)        
    end
  end
end