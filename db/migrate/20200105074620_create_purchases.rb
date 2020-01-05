class CreatePurchases < ActiveRecord::Migration[5.2]
  def change
    create_table :purchases do |t|
      t.integer :user_id
      t.integer :post_id
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
