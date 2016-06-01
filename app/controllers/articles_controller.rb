class ArticlesController < ApplicationController
  def blog
    @articles = Article.all
  end

  def show
    @article = Article.find_by_title(params[:title])
  end
end
