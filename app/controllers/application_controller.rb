require "user_support"
require "company_support"

class ApplicationController < ActionController::Base
  protect_from_forgery

  def landing
    redirect_to company_path(current_user.company) if user_signed_in?
  end

  def token_route
    company = Company.find_by_token(params[:token]).last
    if company.present?
      redirect_to company_path(company.id, :token => params[:token])
    else
      render :template => "application/forbidden"
    end
  end

  def not_found

  end

  protected

  include UserSupport

  helper_method :user_signed_in?, :current_user
end
