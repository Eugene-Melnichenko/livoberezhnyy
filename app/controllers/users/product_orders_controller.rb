class Users::ProductOrdersController < ApplicationController
  def index
    @services = Service.all
  end
end
