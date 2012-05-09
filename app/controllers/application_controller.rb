class ApplicationController < ActionController::Base
  protect_from_forgery

  def debug
    Struct.new("Drink",:name, :description)
    @drink = Drink.new("Yon", "cool dude")

  end
end
