class Admin::OrdersController < ApplicationController
  def index
    @path = Rails.application.routes.recognize_path(request.referer)
    if @path[:controller] == "admin/members" && @path[:action] == "show"
       @order = Order.where(member_id: params[:format]).page(params[:page]).per(5)
    elsif @path[:controller] == "admin/admins"
       @order = Order.where(created_at: Time.zone.today.all_day).page(params[:page]).per(5)
    else
       @order = Order.page(params[:page]).per(5)
  end
  end

  def show
  	# 注文内容の情報を取得しています！
  	@order = Order.find(params[:id])
  	@order_items = @order.order_items
  	# @order_item = OrderItem.find(params[:id])
  end

  def update
  	@order = Order.find(params[:id])
  	@order_items = @order.order_items
  	@order.update(order_params)

 
 	if @order.order_status == "入金確認"
	     @order_items.update_all(making_status: 1)
	     end
  		 redirect_to  admin_order_path(@order)
    end
    # こっちでも可能
    # emunの変換前取得している
  	# if @order.read_attribute_before_type_cast(:order_status) == 1
  	# 	@order_items.each do |order_item|
  	# 	order_item.update(making_status: 1)
  	# 	end
   #  end


  private

  def order_params
  	params.require(:order).permit(:order_status)
  end

end
