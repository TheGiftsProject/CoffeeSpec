class ApplicationController < ActionController::Base
  protect_from_forgery

  def debug
    @drink = Drink.first
  end
end
