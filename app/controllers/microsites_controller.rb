class MicrositesController < ApplicationController
  before_filter :menu_bar
  def show
    @microsite = Microsite.find(params[:id])
    render :layout => false
  end
end
