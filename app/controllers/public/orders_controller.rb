class Public::OrdersController < ApplicationController
  def index
  end

  def show
  end

  def new
    @order = Order.new
    @addresses = Address.all
  end

  def confirm
      params[:order][:payment_method] = params[:order][:payment_method].to_i
    @order = Order.new(order_params)
    if params[:order][:address_number] == "1"
    @order.postal_code = current_member.postal_code
    @order.address = current_member.address
    @order.name = current_member.last_name+current_member.first_name
  elsif  params[:order][:address_number] ==  "2"
    @order.address = Address.find(id: :address)
byebug
  end

    @cart_items = CartItem.where(member_id: current_member.id)
    @total = 0

end


  def thanks
  end
  def create
    #  @order = Order.new(session[:order])
    # @order =  order_params
    redirect_to public_orders_123456_thanks_path
     # @order.save
  end

 private

  def order_params
    params.require(:order).permit(:payment_method, :address,:postage,:postal_code,:name,:total_fee,:addre
      )
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