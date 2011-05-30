class FormController < ApplicationController
  def show
    @form = Form.find(params[:id])
  end
end
