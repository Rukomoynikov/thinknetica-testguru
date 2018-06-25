class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_locale

  private

  def after_sign_in_path_for(resource)
    flash[:info] = "Привет, #{ resource.first_name } #{ resource.last_name }!"

    path = if resource.is_a?(Admin) 
      admin_root_path
    else
      root_path
    end

    path
  end

  def configure_permitted_parameters
     devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])
  end

  def set_locale
    I18n.locale = I18n.locale_available?(params[:lang]) ? params[:lang] : I18n.default_locale
  end

  def default_url_options
    return { lang: I18n.locale } if I18n.default_locale != I18n.locale

    {}
  end
end
