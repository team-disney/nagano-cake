class AddOrderIdToOrderDetails < ActiveRecord::Migration[5.2]
  def up
    add_column :order_details, :order_id, :integer
    change_column_null :order_details, :order_id, false
  end

  def down
    remove_column :order_details, :order_id
  end
end
