class PagesController < ApplicationController
  before_filter :menu_bar
  
  def home
    @highlights = Article.where("highlights != ''").order("created_at").first(20)
    @carrusel = Article.where("carrusel = ?", true)
    @promotions = Promotion.order("created_at").first(5)
    @videos = Video.order("created_at").first(5)
    @comments = Comment.order("created_at").first(5)
  end
end
