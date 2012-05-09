class DrinksController < ApplicationController

  before_filter :must_be_logged_in, :except => [:view]
  before_filter :load_drink, :only => [:update, :show, :destroy]

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

  def update
    @drink.update_attributes(params[:drink])
    if @drink.save
      redirect_to drinks_path, :notice => "Drink updated"
    else
      render :action => :new
    end
  end

  def index
    @drinks = current_user.drinks
  end

  def show
    render :template => "drinks/new"
  end

  def destroy
    @drink.update_attribute(:user, nil)
    redirect_to drinks_path, :notice => "Drink deleted"
  end

  def view
    @user = User.find_by_token(params[:token])
    if @user.nil?
      redirect_to root_path, :error => "Wrong url given"
    end
    @drinks = @user.drinks
    render :action => :index
  end


  private

  def load_drink
    @drink ||= current_user.drinks.find(params[:id])
  end

end
