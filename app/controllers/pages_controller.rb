class PagesController < ApplicationController
  before_filter :menu_bar
  
  def home
    @articles = Article.where("highlights != ''").order("created_at").first(20)
  end
end
