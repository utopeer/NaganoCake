class ChangeWithdrawalStatusOfMembers < ActiveRecord::Migration[5.2]
  def up
  	change_column :members,:withdrawal_status, :integer, default: "0"
  end

  def down
  	change_column :members,:withdrawal_status,:integer
  end
end
