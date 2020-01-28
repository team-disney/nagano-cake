class ChangeDefaultToColumns < ActiveRecord::Migration[5.2]

  #Change

  def up
    change_column_default :genres, :status, 0
    change_column_default :items, :status, 0
    change_column_default :orders, :status, 0
    change_column_default :order_details, :production_status, 0
    change_column_default :orders, :payment_method, 0
  end

  def down
    change_column_default :genres, :status, nil
    change_column_default :items, :status, nil
    change_column_default :orders, :status, nil
    change_column_default :order_details, :production_status, nil
    change_column_default :orders, :payment_method, nil
  end
end
