class ApplicationController < ActionController::Base
  protect_from_forgery

  def debug
    @drink = Drink.create(:name => "yon")
  end
end
