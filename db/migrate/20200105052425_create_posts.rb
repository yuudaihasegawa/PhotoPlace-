# frozen_string_literal: true

class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :title, index: true
      t.integer :user_id, null: false
      t.text :content
      t.string :address, index: true
      t.float :longitude
      t.float :latitude
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
