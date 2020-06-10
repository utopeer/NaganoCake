class Public::CartItemsController < ApplicationController
before_action :authenticate_member!
 before_action :cart_item_item?, only: [:create]

  def index
    @cart_items = current_member.cart_items
    @total = 0
    # totalに代入するものは整数値と宣言！
	end

	def create
	if current_member.cart_items.count >= 1 #カート内に商品があるか？
	  if nil != current_member.cart_items.find_by(item_id: params[:cart_item][:item_id]) #カートに入れた商品はすでにカートに追加済か？
		   @cart_item_u = current_member.cart_items.find_by(item_id: params[:cart_item][:item_id]) #カート内のすでにある商品の情報取得
		   @cart_item_u.number_of_items += params[:cart_item][:number_of_items].to_i #既にある情報に個数を合算
		   @cart_item_u.update(number_of_items: @cart_item_u.number_of_items) #情報の更新　個数カラムのみ
		   redirect_to public_cart_items_path #カートページ遷移
		 else
			 	@cart_item = CartItem.new(cart_item_params) #新しくカートの作成
			@cart_item.member_id = current_member.id #誰のカートか紐付け
			if @cart_item.save #情報を保存できるか？
				 redirect_to public_cart_items_path #カートページ遷移
			else
				@items = Item.where(sale_status: 0).page(params[:page]).per(8) #販売ステータスが「0」のものを見つける
		    @quantity = Item.count #商品の数をカウント
		    @genres = Genre.where(valid_invalid_status: 0) #有効、無効ステータスが0のものを見つける
				render 'index' #indexアクションを呼び出す
		end
	end

	else
		@cart_item = CartItem.new(cart_item_params)#新しくカートの作成
		@cart_item.member_id = current_member.id#誰のカートか紐付け
		if @cart_item.save#情報を保存できるか？
			 redirect_to public_cart_items_path#カートページ遷移
		else
			@items = Item.where(sale_status: 0).page(params[:page]).per(8)#販売ステータスが「0」のものを見つける
	    @quantity = Item.count#商品の数をカウント
	    @genres = Genre.where(valid_invalid_status: 0)#有効、無効ステータスが0のものを見つける
			render 'index'#indexアクションを呼び出す
		end
		# @order_item = OrderItem.new()
		# @order_item.item = @cart_item.item
		# @order_item.number_of_items = @cart_item.number_of_items
		# @order_item.items_tax_included_price = @cart_item.item.unit_price_without_tax*1.1
		# @order_item.save
	end
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

	def cart_item_item?
		redirect_to public_item_path(params[:cart_item][:item_id]), notice: "個数を入力してください。" if params[:cart_item][:number_of_items].empty?
	end

	def cart_item_params
		params.require(:cart_item).permit(:item_id, :number_of_items,:member_id)
	end
end
