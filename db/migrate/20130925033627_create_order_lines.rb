class CreateOrderLines < ActiveRecord::Migration
  def change
    create_table :order_lines do |t|
      t.integer :order_id
      t.integer :book_id
      t.decimal :unit_price
      t.integer :quantity

      t.timestamps
    end
  end
end
