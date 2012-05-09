require "user_support"
class ApplicationController < ActionController::Base
  protect_from_forgery


  def landing
    redirect_to drinks_path if user_signed_in?
  end

  protected

  include UserSupport

  helper_method :user_signed_in?, :current_user
end
