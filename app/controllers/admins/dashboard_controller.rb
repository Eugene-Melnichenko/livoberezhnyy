class Admins::DashboardController < ApplicationController
  
  before_action :authenticate_admin!

  def index
    @services = Service.order(created_at: :desc).paginate(:page => params[:page], per_page: 5)
    @users = User.order(created_at: :desc).paginate(:page => params[:page], per_page: 5)

    @users_count = User.count
    @users_active_count = User.where.not(confirmed_at: nil).count
    @users_deactive_count = User.where(confirmed_at: nil).count
    @articles_count = Article.count
    @services_count = Service.count
    @orders_count = Order.count
  end

end
