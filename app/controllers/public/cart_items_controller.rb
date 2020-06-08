class Public::CartItemsController < ApplicationController
before_action :authenticate_member!

  def index
    @cart_items = current_member.cart_items
    @total = 0
    # totalに代入するものは整数値と宣言！
	end

	def create
		@cart_item = CartItem.new(cart_item_params)
		@cart_item.member_id = current_member.id
		if @cart_item.save
			 redirect_to public_cart_items_path
		else
			@items = Item.where(sale_status: 0).page(params[:page]).per(8)
	    @quantity = Item.count
	    @genres = Genre.where(valid_invalid_status: 0)
			render 'public/items/index'
		end
		# @order_item = OrderItem.new()
		# @order_item.item = @cart_item.item
		# @order_item.number_of_items = @cart_item.number_of_items
		# @order_item.items_tax_included_price = @cart_item.item.unit_price_without_tax*1.1
		# @order_item.save
	end

	def update
		@cart_item = CartItem.find(params[:id])
		@cart_item.update(cart_item_params)
		redirect_to public_cart_items_path
	end

	def destroy
		@cart_item = CartItem.find(params[:id])
		@cart_item.destroy
		redirect_to public_cart_items_path
	end

	def destroy_all
		@cart_items = current_member.cart_items
		@cart_items.destroy_all
		redirect_to public_cart_items_path
	end

	private

	def cart_item_params
		params.require(:cart_item).permit(:item_id, :number_of_items,:member_id)
	end
end
