class FormController < ApplicationController
  before_filter :menu_bar
  
  def show
    @form = Form.find(params[:id])
  end
end
