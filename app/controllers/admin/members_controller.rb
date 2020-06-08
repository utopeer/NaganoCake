class Admin::MembersController < ApplicationController
  before_action :authenticate_admin!

  # 会員一覧画面
  def index
  	@members = Member.page(params[:page]).per(10)
  end

  # 会員情報編集画面
  def edit
  	@member = Member.find(params[:id])
  end

  def update
  	@member = Member.find(params[:id])
  	if @member.update(member_params)
  		redirect_to admin_member_path(@member)
  	else
  		render "edit"
  	end
  end

  def show
     @member = Member.find(params[:id])
  end

  private

  def member_params
  	params.require(:member).permit(:email, :last_name, :first_name, :last_name_kana, :postal_code,:address, :phone_number, :withdrawal_status)
  end
end
