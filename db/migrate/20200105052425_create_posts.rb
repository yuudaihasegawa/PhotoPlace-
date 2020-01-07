class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :title, index: true
      t.text :content
      t.integer :price, default: 0
      t.string :address, index: true
      t.float :latitude
      t.float :longitude
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
