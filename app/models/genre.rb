class Genre < ApplicationRecord
<<<<<<< HEAD
	# アソシエーション
  has_many :items

  # enum設定
	enum valid_invalid_status: { 有効: 0, 無効: 1} #enumの記述方式

  # バリデーション
	validates :name, presence: true #バリデーションname空欄禁止

=======
>>>>>>> c117f7fb2d015c8f36451339df7dc5e98104217b
end
