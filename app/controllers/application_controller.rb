class ApplicationController < ActionController::Base
  protect_from_forgery
  layout :layout_by_resource

    def layout_by_resource
      if devise_controller? && (resource_name == :admin||resource_name == :user)
        return "admins"
      end
        "application"
    end
  
  def after_sign_in_path_for(resource)
    if resource.is_a?(Admin) || resource.is_a?(User)
      admins_users_path
    else
      super
    end
  end
  
  def menu_bar
    @main_menu=Category.find_by_name("Menu Principal")
  end
end
