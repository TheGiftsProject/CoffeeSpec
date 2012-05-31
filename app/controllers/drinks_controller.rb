class DrinksController < ApplicationController

  include CompanySupport

  before_filter :must_edit
  before_filter :load_drink, :only => [:update, :edit, :destroy]

  def new
    @drink = @company.drinks.build(:drink_type => :coffee, :sugar_type => :white, :sugar_amount => 1.5, :milk_amount => :little, :milk_type => :regular, :strength => :normal)
  end

  def create
    @drink = @company.drinks.build(params[:drink])
    if @drink.save
      redirect_to company_dashboard, :notice => "Drink added"
    else
      render :action => :new
    end
  end

  def update
    @drink.update_attributes(params[:drink])
    if @drink.save
      redirect_to company_dashboard, :notice => "Drink updated"
    else
      render :action => :new
    end
  end

  def index
    @drinks = @company.drinks
    render :json => @drinks
  end

  def edit
    render :template => "drinks/new"
  end

  def destroy
    @drink.update_attribute(:company, nil)
    redirect_to company_dashboard, :notice => "Drink deleted"
  end

  private

  def load_drink
    @drink ||= @company.drinks.find(params[:id])
  end

end
