class ChangeNotNullToModels < ActiveRecord::Migration[5.2]

  # Changes
  def up
    # Adresses の Not Nil
    change_column_null :addresses, :name, false
    change_column_null :addresses, :zipcode, false
    change_column_null :addresses, :address, false
    change_column_null :addresses, :end_user_id, false
    change_column_null :addresses, :deleted_at, true

    # items の Not Nil
    change_column_null :items, :name, false
    change_column_null :items, :genres_id, false
    change_column_null :items, :item_status, false
    change_column_null :items, :caption, false
    change_column_null :items, :price, false
    change_column_null :items, :image_id, false
    change_column_null :items, :deleted_at, true

    # genres の Not Nil
    change_column_null :genres, :name, false
    change_column_null :genres, :genres_status, false

    # cart_items の Not Nil
    change_column_null :cart_items, :end_user_id, false
    change_column_null :cart_items, :item_id, false
    change_column_null :cart_items, :amount, false

    # orders の Not Nil
    change_column_null :orders, :end_user_id, false
    change_column_null :orders, :name, false
    change_column_null :orders, :zipcode, false
    change_column_null :orders, :address, false
    change_column_null :orders, :order_status, false
    change_column_null :orders, :sum_price, false
    change_column_null :orders, :shipping_price, false
    change_column_null :orders, :payment_price, false
    change_column_null :orders, :payment_method, false

    # order_details の Not Nil
    change_column_null :order_details, :item_name, false
    change_column_null :order_details, :amount, false
    change_column_null :order_details, :price, false
    change_column_null :order_details, :production_status, false
  end

  # Rollbacks
  def down 
    # Adresses の Not Nil
    change_column_null :addresses, :name, true
    change_column_null :addresses, :zipcode, true
    change_column_null :addresses, :address, true
    change_column_null :addresses, :end_user_id, true
    change_column_null :addresses, :deleted_at, true

    # items の Not Nil
    change_column_null :items, :name, true
    change_column_null :items, :genres_id, true
    change_column_null :items, :item_status, true
    change_column_null :items, :caption, true
    change_column_null :items, :price, true
    change_column_null :items, :image_id, true
    change_column_null :items, :deleted_at, true

    # genres の Not Nil
    change_column_null :genres, :name, true
    change_column_null :genres, :genres_status, true

    # cart_items の Not Nil
    change_column_null :cart_items, :end_user_id, true
    change_column_null :cart_items, :item_id, true
    change_column_null :cart_items, :amount, true

    # orders の Not Nil
    change_column_null :orders, :end_user_id, true
    change_column_null :orders, :name, true
    change_column_null :orders, :zipcode, true
    change_column_null :orders, :address, true
    change_column_null :orders, :order_status, true
    change_column_null :orders, :sum_price, true
    change_column_null :orders, :shipping_price, true
    change_column_null :orders, :payment_price, true
    change_column_null :orders, :payment_method, true

    # order_details の Not Nil
    change_column_null :order_details, :item_name, true
    change_column_null :order_details, :amount, true
    change_column_null :order_details, :price, true
    change_column_null :order_details, :production_status, true
  end
end
