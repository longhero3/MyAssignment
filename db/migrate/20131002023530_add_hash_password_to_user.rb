class AddHashPasswordToUser < ActiveRecord::Migration
  def change
    add_column :users, :hash_password, :string
  end
end
