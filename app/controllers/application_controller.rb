class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def after_sign_in_path_for(resource)
    path = if resource.is_a?(Admin) 
      admin_root_path
    else
      root_path
    end

    path

    flash[:info] = "Привет, #{ resource.first_name } #{ resource.last_name }!"
  end

  def configure_permitted_parameters
     devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])
  end
end
