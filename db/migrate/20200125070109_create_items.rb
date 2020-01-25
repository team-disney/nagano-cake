class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name
      t.integer :genres_id
      t.integer :item_status
      t.text :caption
      t.integer :price
      t.string :image_id
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
