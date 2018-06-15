class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  private

  def after_sign_in_path_for(resource)
    path = if resource.is_a?(Admin) 
      admin_root_path
    else
      root_path
    end

    path
  end
end
