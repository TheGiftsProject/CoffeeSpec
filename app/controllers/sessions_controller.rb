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

  def update
    if current_user.update_attribute(:company_name, params[:company_name])
      #current_user.save
      render :inline => current_user.company_name
    else
      render :nothing => true, :status => :bad_request
    end
  end

  protected

  def auth_hash
    request.env['omniauth.auth']
  end
end
