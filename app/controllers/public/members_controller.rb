class Public::MembersController < ApplicationController
  before_action :authenticate_member!
  def show
  	@member = current_member
  end

  def edit
  	@member = current_member
  end

  def update
  	@member = current_member
  	@member.update(member_params)
  	redirect_to public_members_path
  end

  def withdrawal
  end

  # ユーザーの退会（論理削除）
  def destroy
    #is_deletedカラムにフラグを立てる(defaultはfalse)
    current_member.update(is_deleted: true, withdrawal_status: 1)
    #ログアウトさせる
    reset_session
    redirect_to root_path
  end
  
 private
  def member_params
   	params.require(:member).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :phone_number, :withdrawal_status, :email)
  end

end
