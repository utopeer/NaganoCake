class Item < ApplicationRecord
  # アソシエーション
	has_many :cart_items
	has_many :order_items
	belongs_to :genre

  # 画像のためのやつ
	attachment :image

  # enumの設定
	enum sale_status: {販売中:0,販売停止:1}

  # バリデーション
  validates :item_name, presence: true
  validates :explanation, presence: true
  validates :unit_price_without_tax, presence: true
end
