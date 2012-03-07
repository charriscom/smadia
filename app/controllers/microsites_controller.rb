class MicrositesController < ApplicationController
  before_filter :menu_bar
  def show
    if params[:name] && @microsite = Microsite.find_by_name(params[:name])
      return redirect_to root_path unless @microsite.external_page
      @external = true
      @form = @microsite.form_details
      render :layout => false if @external
    end
    if params[:id] && @microsite = Microsite.find(params[:id])
      @external = false
      @form = @microsite.form_details
    end
  end
end
