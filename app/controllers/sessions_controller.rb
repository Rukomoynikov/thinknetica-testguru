class SessionsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:create, :new]

  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to cookies[:previous_page]
    else
      flash.now[:alert] = 'Are you guru? Identify yourself!'
      render :new
    end
  end

  def new
  end

  def destroy
    session.delete('user_id')
    redirect_to tests_path
  end
end
