class Public::CartItemsController < ApplicationController

    def index
    	@cart_items = current_member.cart_items
	end

	def create
	end

	def update
	end

	def destroy
	end

	def destroy_all
	end
end
