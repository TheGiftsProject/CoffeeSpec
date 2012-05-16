class DrinksController < ApplicationController

  include CompanySupport

  before_filter :can_edit?
  before_filter :load_drink, :only => [:update, :edit, :destroy]

  def new
    @drink = @company.drinks.build(:drink_type_id => 1,
                       :strength_id => 2,
                       :milk_type_id => 1,
                       :milk_amount_id => 2,
                       :sugar_type_id => 1,
                       :sugar_amount_id => 2,
    )
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
