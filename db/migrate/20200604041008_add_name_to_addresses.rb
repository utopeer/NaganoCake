class AddNameToAddresses < ActiveRecord::Migration[5.2]
  def change
    add_column :addresses, :name, :string
    add_column :addresses, :member_id,:integer
    add_column :addresses, :shipping_address,:string
    add_column :addresses, :postal_code,:string

  end
end
