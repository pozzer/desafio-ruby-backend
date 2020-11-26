class TransactionsController < ApplicationController
  before_action :get_store
  
  def index
    @transactions = @store.transactions
  end

  private
    
    def get_store
      @store = Store.find(params[:store_id])
    end
end