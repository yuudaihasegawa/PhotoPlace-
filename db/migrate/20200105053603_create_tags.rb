class CreateTags < ActiveRecord::Migration[5.2]
  def change
    create_table :tags do |t|
      t.string :name, index: true
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
