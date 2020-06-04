class Public::CartItemsController < ApplicationController

    def index
    	@cart_items = current_member.cart_items
	end

	def create
		@cart_item = CartItem.new(cart_item_params)
		@cart_item.member_id = current_member.id
		@cart_item.save
		redirect_to public_cart_items_path
	end

	def update
	end

	def destroy
	end

	def destroy_all
	end

	private
	def cart_item_params
		params.require(:cart_item).permit(:item_id, :number_of_item,:member_id)
	end
end
