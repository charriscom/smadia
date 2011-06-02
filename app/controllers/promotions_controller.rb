class PromotionsController < ApplicationController
  before_filter :menu_bar
  
  def show
    @promotion = Promotion.find(params[:id])
  end
  def buy
    @promotion = Promotion.find(params[:promotion_id])
    @form = Form.find_by_name("Promociones")
  end
end
