class AddColumnsToEndUsers < ActiveRecord::Migration[5.2]
  def change
    # end_users に不足しているカラムを追加
      add_column :end_users, :first_name, :string
      add_column :end_users, :first_name_kana, :string
      add_column :end_users, :last_name, :string
      add_column :end_users, :last_name_kana, :string
      add_column :end_users, :zipcode, :string
      add_column :end_users, :address, :string
      add_column :end_users, :phone_number, :string
      add_column :end_users, :deleted_at, :datetime
  end
end
