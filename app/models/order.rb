class Order < ApplicationRecord
	belongs_to :member
	has_many :order_items
	enum payment_method: {銀行口座:0,クレジットカード:1}
	
end
