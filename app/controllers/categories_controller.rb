class CategoriesController < ApplicationController
  before_filter :menu_bar
  
  def show
    @category = Category.find(params[:id])
  end
  
end
