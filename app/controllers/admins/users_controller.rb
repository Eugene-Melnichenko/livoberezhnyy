class Admins::UsersController < ApplicationController

  before_action :authenticate_admin!

  def index
    @users = User.order(created_at: :desc).paginate(:page => params[:page], per_page: 5)
  end

  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      flash[:primary] = "User deleted(true)"
    else
      flash[:danger] = "User deleted(false)"
    end
      redirect_to root_url
  end

end
