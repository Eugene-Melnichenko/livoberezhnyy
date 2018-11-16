class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_article

  def index
    redirect_to @article
  end

  def create
    @comment = @article.comments.new(comment_params)
    if @comment.save
      redirect_to @article
    else
      redirect_to @article
    end
  end

  def destroy
    @comment = @article.comments.find(params[:id])
    @comment.destroy
    redirect_to @article
  end

  private

  def set_article
    @article = Article.find(params[:article_id])
  end

  def comment_params
    params.require(:comment).permit(:commenter)
  end
end
