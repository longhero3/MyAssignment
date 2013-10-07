class CreateOrderLines < ActiveRecord::Migration
  def change
    create_table :order_lines do |t|
      t.integer :order_id
      t.integer :book_id
      t.decimal :unit_price, :default => 0
      t.integer :quantity, :default => 0

      t.timestamps
    end
  end
end
