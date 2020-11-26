class CreateTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :transactions do |t|
      t.belongs_to :store, foreign_key: true
      t.integer :kind, default: 0
      t.decimal :amount, default: 0.0
      t.string :card_number, default: ""
      t.string :document_number, default: ""
      t.datetime :occurrence_at
      t.timestamps
    end
  end
end
