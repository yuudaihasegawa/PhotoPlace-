class CreateProfileImages < ActiveRecord::Migration[5.2]
  def change
    create_table :profile_images do |t|
      t.integer :user_id
      t.string :profile_image_id
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
