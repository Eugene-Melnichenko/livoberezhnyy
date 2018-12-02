class HomePageController < ApplicationController

  def index
    @articles = Article.order(created_at: :desc).limit(2)
    @company  = Company.last
    @services  = Service.all
  end

end
