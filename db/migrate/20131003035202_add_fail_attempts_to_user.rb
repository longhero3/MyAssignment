class AddFailAttemptsToUser < ActiveRecord::Migration
  def change
    add_column :users, :fail_attempts, :integer, :default => 3
  end
end
