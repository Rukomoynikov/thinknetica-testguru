class Admin::BaseController < ApplicationController
  layout 'admin'

  before_action :admin_required!

  private 

  def admin_required!
    message = 'You are not authorized to do this'
    redirect_to root_path, alert: message unless current_user.admin?
  end
end
