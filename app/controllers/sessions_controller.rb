class SessionsController < ApplicationController

  before_action :signed_in_user, only: :destroy # user must be signed in to sign out
  before_action :correct_user, only: :destroy   # signed in user must be current user to sign out

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      sign_in user
      redirect_back_or home_url
    else
      flash.now[:error] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    sign_out
    redirect_to signin_url
  end
end