class PagesController < ApplicationController
  before_filter :menu_bar
  
  def home
    @highlights = Article.where("highlights != '' and (closed > ? or closed is ?)", Date.today, nil).order("created_at").first(20)
    @noticias = Article.where("(highlights = '' or highlights is NULL) and (closed > ? or closed is ?)", Date.today, nil).order("created_at").first(20)
    @microsites = Microsite.where("home_page = ? and (closed > ? or closed is ?)",true, Date.today, nil).order("created_at").first(20)
    @carrusel = Article.where("carrusel = ? and (closed > ? or closed is ?)", true, Date.today,nil)
    @promotions = Promotion.where("closed > ? or closed is ?", Date.today, nil).shuffle.slice(0,4)
    @videos = Video.where("(closed > ? or closed is ?) and home_page = ?", Date.today, nil, true).shuffle.slice(0,5)
    @comments = Comment.order("created_at").first(5)
  end
  def contact
    @form = Form.find_by_name("Contacto")
    @services = Service.all
  end
  def search
    param = params[:search][:param]
    unless param.blank?
      @articles = Article.where("title like '%#{param}%' or highlights like '%#{param}%' or summary like '%#{param}%' or content like '%#{param}%' and (closed > ? or closed is ?)", Date.today, nil)
      @microsites = Microsite.where("name like '%#{param}%' or summary like '%#{param}%' or content like '%#{param}%' and (closed > ? or closed is ?)", Date.today, nil)
      @promotions = Promotion.where("title like '%#{param}%' or summary like '%#{param}%' or content like '%#{param}%' and (closed > ? or closed is ?)", Date.today, nil)
      @videos = Video.where("title like '%#{param}%' or description like '%#{param}%' and (closed > ? or closed is ?)", Date.today, nil)
    else
      @articles = []
      @microsites = []
      @promotions = []
      @videos = []
    end
  end
end
