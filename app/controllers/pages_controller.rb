class PagesController < ApplicationController
  before_filter :menu_bar
  
  def home
    @highlights = Article.where("highlights != '' and closed >= ?", Date.today).order("created_at").first(20)
    @microsites = Microsite.where("home_page = ? and closed >= ?",true, Date.today).order("created_at").first(20)
    @carrusel = Article.where("carrusel = ? and closed >= ?", true, Date.today)
    @promotions = Promotion.where("closed >= ?", Date.today).order("created_at").first(4)
    @videos = Video.where("closed >= ?", Date.today).order("created_at").first(5)
    @comments = Comment.order("created_at").first(5)
  end
  def contact
    @form = Form.find_by_name("Contacto")
    @services = Service.all
  end
end
