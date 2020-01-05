class CreateMaps < ActiveRecord::Migration[5.2]
  def change
    create_table :maps do |t|
      t.integer :post_id
      t.string :address, index: true
      t.float :latitude
      t.float :longitude
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
