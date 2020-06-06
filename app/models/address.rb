class Address < ApplicationRecord
	belongs_to :member
	
	# 配送先住所
	def address_all
    self.postal_code+" "+self.shipping_address+" "+self.name
  end
end
