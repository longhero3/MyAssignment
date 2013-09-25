class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.date :date
      t.integer :total_amount
      t.integer :user_id
      t.string :shipping_address

      t.timestamps
    end
  end
end
