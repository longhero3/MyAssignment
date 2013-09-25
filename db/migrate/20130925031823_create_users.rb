class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :password
      t.string :phone
      t.string :full_name
      t.date :birthday
      t.date :create_date

      t.timestamps
    end
  end
end
