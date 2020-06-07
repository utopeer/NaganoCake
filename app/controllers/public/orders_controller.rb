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
    @address = Address.new
  end

  def confirm
      params[:order][:payment_method] = params[:order][:payment_method].to_i
    @order = Order.new(order_params)
    if params[:order][:address_number] == "1"
    @order.postal_code = current_member.postal_code
    @order.address = current_member.address
    @order.name = current_member.last_name+current_member.first_name
  elsif  params[:order][:address_number] ==  "2"
    @order.postal_code = Address.find(params[:order][:address]).postal_code
    @order.address = Address.find(params[:order][:address]).shipping_address
    @order.name = Address.find(params[:order][:address]).name
  elsif params[:order][:address_number] ==  "3"
    @address = Address.new()
    @address.shipping_address = params[:order][:shipping_address]
    @address.name = params[:order][:name]
    @address.postal_code = params[:order][:postal_code]
    @address.member_id = current_member.id
    @address.save
    @order.postal_code =@address.postal_code
    @order.name = @address.name
    @order.address = @address.shipping_address
    order_item = order_item.id @order.id
  end
    @cart_items = CartItem.where(member_id: current_member.id)
    @total = 0
end


  def thanks
  end
  def create
    @order = Order.new(order_params)
    @order.member_id = current_member.id
    @order.save
#order_itmemの保存
    current_member.cart_items.each do |cart_item|
    @order_item = OrderItem.new
    @order_item.item_id = cart_item.item_id
    @order_item.number_of_items = cart_item.number_of_items
    @order_item.items_tax_included_price = cart_item.number_of_items*1.1
    @order_item.order_id =  @order.id
    @order_item.save
   end
    # @order_items = OrderItem.where(order_id: @order.id)
    current_member.cart_items.destroy_all
    redirect_to public_orders_thanks_path
  end

 private

  def order_params
    params.require(:order).permit(:payment_method, :address,:postage,:postal_code,:name,:total_fee,:addre
      )
  end

  def address_params
     params.permit(:shipping_address,:name,:postal_code,:member_id)
end
  # :name,:postal_code,
end

# 頭よくなればできる
  # def session_create
  #   session[:order] = Order.new()
  #   session[:order] = params
  # if session[:order][:address_number] == 1
  #   session[:order][:postal_code] = current_member.postal_code
  #   session[:order][:address] = current_member.address
  #   session[:order][:name] = current_member.last_name+current_member.first_name

  # elsif  session[:order][:address_number] ==  2
  #   session[:order][:address] = Address.find(id: :address)
  # end


  #   session[:order][:payment_method] = params[:order][:payment_method].to_i
  #   redirect_to  public_orders_confirm_path
     # session[:order].clear 「sessionのデータ解放」
  # end