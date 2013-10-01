class AddCartIdToOrderLine < ActiveRecord::Migration
  def change
    add_column :order_lines, :cart_id, :integer
  end
end
