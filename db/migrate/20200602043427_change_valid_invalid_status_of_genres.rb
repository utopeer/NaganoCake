class ChangeValidInvalidStatusOfGenres < ActiveRecord::Migration[5.2]
  def up
    change_column :genres, :valid_invalid_status, :integer, default: 0
  end

  def down
    change_column :genres, :valid_invalid_status, :integer
  end
end
