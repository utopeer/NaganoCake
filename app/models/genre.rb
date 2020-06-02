class Genre < ApplicationRecord
	has_many :items

	enum valid_invalid_status: { 有効: 0, 無効: 1} #enumの記述方式

	validates :name, presence: true #バリデーションname空欄禁止
end
