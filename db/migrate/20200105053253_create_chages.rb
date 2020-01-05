class CreateChages < ActiveRecord::Migration[5.2]
  def change
    create_table :chages do |t|
      t.integer :user_id
      t.integer :chage_price, default: 0
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
