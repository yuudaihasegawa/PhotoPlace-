class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :title, index: true
      t.integer :user_id,:null => false
      t.text :content
      t.integer :price, default: 0
      t.string :address, index: true
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
