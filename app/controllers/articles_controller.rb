class ArticlesController < ApplicationController
  before_filter :menu_bar
  def show
    @article = Article.find(params[:id])
  end
end
