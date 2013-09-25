class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :rating
      t.text :content
      t.integer :user_id
      t.integer :book_id
      t.date :comment_date

      t.timestamps
    end
  end
end
