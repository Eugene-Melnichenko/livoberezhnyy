class Users::OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_order, only: [:destroy] 

  def new
    @order     = Order.new
    @orders    = Order.where(user_id: current_user)
    @services  = Service.all
  end

  def create
    @order = current_user.orders.new(order_params)
    if @order.save
      flash[:primary] = "Замовлення успішно створено."
    else
      flash[:danger] = "Щоб стоврити замовлення, потріьно виберіти послугу."
    end
    redirect_to new_users_order_path
  end

  def destroy
    if @order.destroy
      flash[:primary] = "Замовлення успішно видалено."
    else
      flash[:danger] = "Замовлення не видалено"
    end
    redirect_to new_users_order_path
  end

  private

  def set_order
    @order = Order.find(params[:id])
  end

  def order_params
    params.require(:order).permit(:message, :service_id)
  end

end
