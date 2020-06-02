class ChangeSaleStatusOfItems < ActiveRecord::Migration[5.2]
  def up
    change_column :items, :sale_status, :integer, default: 0
  end

  def down
    change_column :items, :sale_status, :integer
  end
end
