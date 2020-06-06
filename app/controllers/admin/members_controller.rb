class Admin::MembersController < ApplicationController
  before_action :authenticate_admin!
  def index
  	
  end

  def edit
  	@member = Member.find(params[:id])
  end

  def update
  	@member = Member.find(params[:id])
  	if @member.update!(member_params)
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
