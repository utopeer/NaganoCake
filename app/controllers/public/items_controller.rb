class Public::ItemsController < ApplicationController
  def index
    @items = Item.page(params[:page]).per(8) # ページネーションの追加/8件ごとにページ作成
    @quantity = Item.count # quantity => 総量/.count =>カウントメソッド、配列の要素の数を数えるための機能
    @genres = Genre.all
  end

  def show
    @item = Item.find(params[:id])
    @genres = Genre.all
  end
end
