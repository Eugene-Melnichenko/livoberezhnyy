class Users::OrdersController < ApplicationController
  def index
  end

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
      raise @order.inspect  
    end
    redirect_to new_users_order_path
  end

  def destroy
    @order = Order.find(params[:id])
    if @order.destroy
      flash[:primary] = "Замовлення успішно видалено."
    else
      flash[:danger] = "Замовлення не видалено"
    end
    redirect_to new_users_order_path
  end

  private

  def order_params
    params.require(:order).permit(:message, :service_id)
  end

end
