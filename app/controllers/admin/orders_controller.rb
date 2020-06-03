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
  	@order_items = OrderItem.all
  end

  def update
  	else

  end
end
