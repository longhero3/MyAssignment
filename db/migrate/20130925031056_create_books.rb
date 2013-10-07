class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.text :description
      t.string :author
      t.string :publisher
      t.string :published_date
      t.decimal :price
      t.string :img_url
      t.integer :total_rating_value, :default => 0
      t.integer :rating_count, :default => 0

      t.timestamps
    end
  end
end
