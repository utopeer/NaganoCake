class CreateShippingAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :shipping_addresses do |t|

      t.integer :member_id
      t.string :shipping_address
      t.string :postal_code
      t.string :name

      t.timestamps
    end
  end
end
