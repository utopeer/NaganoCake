class Admin::MembersController < ApplicationController
  def index
  end

  def edit
  end

  def show
     @member = Member.find(params[:id])
  end
end
