class SessionsController < ApplicationController

  def create
    @user = User.find_or_create_from_auth_hash(auth_hash)
    sign_in(@user)
    redirect_to root_path
  end

  def destroy
    sign_out
    redirect_to root_path, :notice => "Successfully signed out!"
  end

  protected

  def auth_hash
    request.env['omniauth.auth']
  end
end
