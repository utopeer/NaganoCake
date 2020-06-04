class Admin::OrderItemsController < ApplicationController

	def update
		@order_item = OrderItem.find(params[:id])
		@order = @order_item.order
		# @order_items = OrderItem.all
		@order_item.update(order_item_params)
		# @order_item = Order.OderItem.find(params[:id])
		# @order_item.update(order_item_params)

		if @order_item.making_status == "製作中"
			@order.update(order_status: 2)
		elsif @order.order_items.count ==  @order.order_items.where(making_status: "製作完了").count
			@order.update(order_status: 3)
		end
		redirect_to admin_order_path(@order_item.order)
	end


	private

	  def order_item_params
      params.require(:order_item).permit(:making_status)
      end
end

