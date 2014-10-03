class SessionsController < ApplicationController

  before_action :redirect_if_user, only:  :new

  def new
    render :new
  end

  def create
    user = User.find_by_credentials(
    params[:user][:email],
    params[:user][:password]
    )
    if user.nil?
      render :new
    else
      login_user!(user)
      redirect_to user_url(user)
    end
  end

  def destroy
    logout_user!(current_user)
    redirect_to new_session_url
  end

  def redirect_if_user
    if signed_in?
      flash[:user] = "Already Signed in as #{current_user.email}"
      redirect_to user_url(current_user)
    end
  end


end
