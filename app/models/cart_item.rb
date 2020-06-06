class CartItem < ApplicationRecord
	belongs_to :member
	belongs_to :item
	
	# def total
	# 	self.cart_item.item.unit_price_without_tax * self.cart_item.number_of_items
	# end
end
