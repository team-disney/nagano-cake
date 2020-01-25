class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :end_user_id
      t.string :name
      t.string :zipcode
      t.string :address
      t.integer :order_status
      t.integer :sum_price
      t.integer :shipping_price
      t.integer :payment_price
      t.integer :payment_method

      t.timestamps
    end
  end
end
