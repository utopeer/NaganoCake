class Admin::ItemsController < ApplicationController
  def index
  	@items = Item.all
  end

  def show
  end

  def new
  	@item = Item.new
  end

  def create
  	@item = Item.create!(item_params)
  	if @item.save
  	   redirect_to admin_items_path
  	else
  	   render "new"
  	end
  end

  def edit
  end

  def item_params
  	params.require(:item).permit(:genre_id, :item_name, :unit_price_without_tax, :sale_status, :explanation, :image)
  end
end
