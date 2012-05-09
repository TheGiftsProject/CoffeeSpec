class DrinksController < ApplicationController

  def new
    @drink = Drink.new(:drink_type_id => 1,
                       :strength_id => 2,
                       :milk_type_id => 1,
                       :milk_amount_id => 2,
                       :sugar_type_id => 1,
                       :sugar_amount_id => 2
    )
  end

  def create
    @drink = Drink.create(params[:drink])
    if @drink.errors.empty?
      redirect_to drinks_path
    else
      flash[:error] = @drink.errors
      redirect_to new_drink_path
    end
  end

  def index

  end
end
