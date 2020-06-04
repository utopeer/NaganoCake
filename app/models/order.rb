class Order < ApplicationRecord
	belongs_to :member
	has_many :order_items
	enum payment_method: {銀行口座:0,クレジットカード:1}

	enum order_status: {入金待ち:0,入金確認:1,製作中:2,発送準備中:3,発送済:4}

end
