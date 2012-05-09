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
    @drink = Drink.new(params[:drink])
    if @drink.save
      redirect_to drinks_path, :notice => "Drink added"
    else
      render :action => :new
    end
  end

  def index
  end
end
