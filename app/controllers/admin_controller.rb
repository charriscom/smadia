class AdminController < ApplicationController
  before_filter :authenticate_admin_or_user
  before_filter :profile_filter
  layout 'admins'
  
  def authenticate_admin_or_user
    unless admin_signed_in? || user_signed_in?
      flash[:error] = "Debes ingresar como usuario registrado antes de continuar."
      redirect_to pages_home_path
    end
  end
  
  def profile_filter
    controller=params[:controller].split("/")[1].singularize
    action=params[:action]
    action = "view" if action == "index" || action == "show"
    action = "create" if action == "new"
    action = "update" if action == "edit"
    action = "export" if params[:format] == "xls"
    unless controller == "profile"   
      unless admin_signed_in? || current_user.profile.send(controller+"_"+action)
        flash[:error] = "No tiene los permisos adecuados para esta operacion"
        redirect_to admins_users_path
      end
    end
  end
end
