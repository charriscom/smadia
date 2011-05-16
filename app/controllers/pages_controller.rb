class PagesController < ApplicationController
  before_filter :menu_bar
  
  def home
    @highlights = Article.where("highlights != ''").order("created_at").first(20)
    @microsites = Microsite.where("home_page = ?",true).order("created_at").first(20)
    @carrusel = Article.where("carrusel = ?", true)
    @promotions = Promotion.order("created_at").first(4)
    @videos = Video.order("created_at").first(5)
    @comments = Comment.order("created_at").first(5)
  end
  def contact
    @form = Form.find_by_name("Contacto")
  end
end
