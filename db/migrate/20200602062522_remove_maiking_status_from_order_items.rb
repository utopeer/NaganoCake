class RemoveMaikingStatusFromOrderItems < ActiveRecord::Migration[5.2]
  def change
    remove_column :order_items, :maiking_status, :integer, default: 0
  end
end
