class ChangeEndUserNillFalse < ActiveRecord::Migration[5.2]
  
    # Changes
    # End_users の Nil を許さない
    def up
      change_column_null :end_users, :first_name, false
      change_column_null :end_users, :first_name_kana, false
      change_column_null :end_users, :last_name, false
      change_column_null :end_users, :last_name_kana, false
      change_column_null :end_users, :zipcode, false
      change_column_null :end_users, :address, false
      change_column_null :end_users, :phone_number, false
      change_column_null :end_users, :deleted_at, true
    end

    # Rollbacks
    def down
      change_column_null :end_users, :first_name, true
      change_column_null :end_users, :first_name_kana, true
      change_column_null :end_users, :last_name, true
      change_column_null :end_users, :last_name_kana, true
      change_column_null :end_users, :zipcode, true
      change_column_null :end_users, :address, true
      change_column_null :end_users, :phone_number, true
      change_column_null :end_users, :deleted_at, false
    end

end
