class CartItem < ApplicationRecord
	# アソシエーション
  belongs_to :member
	belongs_to :item

  # バリデーション
  validates :number_of_items, presence: true

	# def total
	# 	self.cart_item.item.unit_price_without_tax * self.cart_item.number_of_items
	# end
end
