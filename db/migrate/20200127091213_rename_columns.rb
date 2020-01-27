class RenameColumns < ActiveRecord::Migration[5.2]

  def up
    rename_column :genres, :genres_status, :status
    rename_column :items, :genres_id, :genre_id
    rename_column :items, :item_status, :status
    rename_column :orders, :order_status, :status
  end

  # to rollback
  def down
    rename_column :genres, :status, :genres_status
    rename_column :items, :genre_id, :genres_id
    rename_column :items, :status, :item_status
    rename_column :orders, :status, :order_status
  end
end
