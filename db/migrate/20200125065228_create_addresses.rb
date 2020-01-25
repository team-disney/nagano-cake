class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string :name
      t.string :zipcode
      t.string :address
      t.integer :end_user_id
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
