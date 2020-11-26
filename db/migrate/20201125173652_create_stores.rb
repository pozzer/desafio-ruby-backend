class CreateStores < ActiveRecord::Migration[5.2]
  def change
    create_table :stores do |t|
      t.string :name, index: true, defult: ""
      t.string :owner_name, index: true, defult: ""
      t.timestamps
    end
  end
end
