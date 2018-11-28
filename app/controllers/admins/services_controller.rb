class Admins::ServicesController < ApplicationController
  
  before_action :authenticate_admin!
  before_action :set_service, only: [:show, :edit, :update, :destroy] 

  def index
    redirect_to root_path
  end

  def show
  end

  def new
    @service = Service.new
  end

  def edit
  end

  def create
    @service = Service.new(service_params)
    if @service.save
      flash[:primary] = "Create service"
      redirect_to root_path
    else
      render 'new'
    end
  end

  def update
    if @service.update(service_params)
      flash[:primary] = "Update service"
      redirect_to root_path
    else
      render 'edit'
    end
  end

  def destroy
    if @service.destroy
      flash[:primary] = "Servise deleted(true)"
    else
      flash[:danger] = "Servise deleted(false)"
    end
    redirect_to root_path
  end

  private

  def set_service
    @service = Service.find(params[:id])
  end

  def service_params
    params.require(:service).permit(:name, :description, :price)
  end

end
