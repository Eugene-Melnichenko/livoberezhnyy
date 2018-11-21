class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_article, only: [:create, :destroy]

  def index
    redirect_to @article
  end

  def create
    @comment = @article.comments.new(comment_params)
    if @comment.save
      flash[:primary] = "New comment(true)"
      redirect_to @article
    else
      flash[:danger] = "New comment(false)"
      redirect_to @article
    end
  end

  def destroy
    @comment = @article.comments.find(params[:id])
    if current_user == @comment.user
      if @comment.destroy
        flash[:primary] = "Destroy(true)"
        redirect_to @article
      else
        flash[:danger] = "Destroy(false)"
        redirect_to @article
      end
    else
      redirect_to root_path
    end
  end

  private

  def set_article
    @article = Article.find(params[:article_id])
  end

  def comment_params
    params.require(:comment).permit(:commenter).merge(user_id: current_user.id)
  end
end
