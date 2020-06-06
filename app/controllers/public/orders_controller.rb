class Public::OrdersController < ApplicationController
  before_action :authenticate_member!
  def index
    @orders = current_member.orders
  end

  def show
    @order = Order.find(params[:id])
    @order_item = @order.order_items
    @total = 0
  end

  def new
    @order = Order.new
    @addresses = Address.all
  end

  def session_create
    session[:order] = Order.new()
    session[:order]= order_params
    session[:order][:payment_method] = params[:order][:payment_method].to_i
    redirect_to  public_orders_confirm_path
  end

  def confirm
    @order = Order.new(session[:order])
    @cart_items = CartItem.where(member_id: current_member.id)
     session[:order][:cart_items] =@cart_items
    @total = 0


    # @order = session[:order]
  end


  def thanks
    @order = Order.new(session[:order][:cart_items])
    @order= session[:order]
     # session[:order].clear 「sessionのデータ解放」

  end

 private

  def order_params
    params.require(:order).permit(:payment_method, :address)
  end
  # :name,:postal_code,
end
