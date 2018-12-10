class Admins::ServicesController < ApplicationController
  
  before_action :authenticate_admin!
  before_action :set_service, only: [:show, :edit, :update, :destroy] 

  def index
    redirect_to root_path
  end

  def new
    @services = Service.order(created_at: :desc).all
    @service = Service.new
  end

  def edit
  end

  def create
    @service = Service.new(service_params)
    if @service.save
      flash[:primary] = "Послуга успіно додана."
      redirect_to new_admins_service_path
    else
      render 'new'
    end
  end

  def update
    if @service.update(service_params)
      flash[:primary] = "Послуга успіно оновленна."
      redirect_to new_admins_service_path
    else
      render 'edit'
    end
  end

  def destroy
    if @service.destroy
      flash[:primary] = "Послуга успішно видалена."
    else
      flash[:danger] = "При видалені послуги виникла помилка."
    end
    redirect_to new_admins_service_path
  end

  private

  def set_service
    @service = Service.find(params[:id])
  end

  def service_params
    params.require(:service).permit(:name, :description, :price)
  end

end
