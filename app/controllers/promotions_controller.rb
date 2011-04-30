class PromotionsController < ApplicationController
  before_filter :menu_bar
  
  def show
    @promotion = Promotion.find(params[:id])
  end
end
