class Admins::DashboardController < ApplicationController
  
  before_action :authenticate_admin!

  def index
    @services = Service.order(created_at: :desc).paginate(:page => params[:page], per_page: 4)
    @users = User.order(created_at: :desc).paginate(:page => params[:page], per_page: 5)
  end

end
