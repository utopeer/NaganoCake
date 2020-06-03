class Admin::OrdersController < ApplicationController
  def index
  end

  def show
  	# 注文内容の情報を取得しています！
  	@order = Order.find(params[:id])
  	@order_items = OrderItem.all
  end

  def update
  	else

  end
end
