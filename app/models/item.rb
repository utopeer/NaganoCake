class Item < ApplicationRecord
<<<<<<< HEAD
  # アソシエーション
=======
  
>>>>>>> c117f7fb2d015c8f36451339df7dc5e98104217b
	has_many :cart_items
	has_many :order_items
	belongs_to :genre

<<<<<<< HEAD
  # 画像のためのやつ
	attachment :image

  # enumの設定
	enum sale_status: {販売中:0,販売停止:1}

  # バリデーション
  validates :item_name, presence: true
  validates :explanation, presence: true
  validates :unit_price_without_tax, presence: true
=======
>>>>>>> c117f7fb2d015c8f36451339df7dc5e98104217b
end
