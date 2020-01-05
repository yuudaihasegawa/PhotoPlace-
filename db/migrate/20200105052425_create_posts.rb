class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :title, index: true
      t.text :content
      t.integer :pre_tax_price, default: 0
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
