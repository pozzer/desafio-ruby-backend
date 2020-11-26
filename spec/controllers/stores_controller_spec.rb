require 'rails_helper'

RSpec.describe StoresController do

  describe 'GET #index' do
    let!(:store){ create(:store)} 
    before { get :index }

    it { should respond_with(200) }

    it 'renders stores' do
      get :index
      assert_equal Store.all, assigns(:stores)
    end
  end
end
  