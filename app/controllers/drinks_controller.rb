class DrinksController < ApplicationController

  before_filter :must_be_logged_in

  def new
    @drink = current_user.drinks.build(:drink_type_id => 1,
                       :strength_id => 2,
                       :milk_type_id => 1,
                       :milk_amount_id => 2,
                       :sugar_type_id => 1,
                       :sugar_amount_id => 2,
    )
  end

  def create
    @drink = current_user.drinks.build(params[:drink])
    if @drink.save
      redirect_to drinks_path, :notice => "Drink added"
    else
      render :action => :new
    end
  end

  def index
    @drinks = current_user.drinks
  end


end
