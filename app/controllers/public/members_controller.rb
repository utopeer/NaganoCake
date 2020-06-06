class Public::MembersController < ApplicationController
  def show
  end

  def edit
  end

  def withdrawal
  end

  # ユーザーの退会（論理削除）
  def destroy
    #is_deletedカラムにフラグを立てる(defaultはfalse)
    current_member.update(is_deleted: true)
    #ログアウトさせる
    reset_session
    redirect_to root_path
  end

end
