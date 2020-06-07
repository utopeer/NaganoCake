class ChangeDatatypePhoneNumberOfMembers < ActiveRecord::Migration[5.2]
  def change
  	change_column :members, :phone_number, :string
  end
end
