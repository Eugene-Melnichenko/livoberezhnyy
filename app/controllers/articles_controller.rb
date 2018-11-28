class ArticlesController < ApplicationController
  
  before_action :authenticate_admin!, except: [:index, :show]
  before_action :set_post, only: [:show, :edit, :update, :destroy] 

  def index
    @articles = Article.order(created_at: :desc)
  end

  def show
  end

  def new
    @article = Article.new
  end

  def edit
  end

  def create
    @article = current_admin.articles.new(article_params)
    if @article.save
      flash[:primary] = "Create article"
      redirect_to @article
    else
      render 'new'
    end
  end

  def update
    if @article.update(article_params)
      flash[:primary] = "Update article"
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy
    if @article.destroy
      flash[:primary] = "Destroy article(true)"
    else
      flash[:danger] = "Destroy article(false)"
    end
    redirect_to articles_path
  end

  private

  def set_post
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :text, :image)
  end

end
