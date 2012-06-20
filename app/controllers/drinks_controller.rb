class DrinksController < ApplicationController

  include CompanySupport

  skip_before_filter :load_company, :only => [:making, :wants]
  skip_before_filter :load_token, :only => [:making, :wants]
  before_filter :must_edit, :except => [:making, :wants]
  before_filter :load_drink, :only => [:update, :edit, :destroy]

  def new
    @drink = @company.drinks.build(:drink_type => :coffee)
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

  def wants
    drink = Drink.find_by_token(params[:drink_token])
    drink.update_attribute(:wants, true)
    render :json => {:success => true}, :callback => params[:callback]
  end

  def making
    drink = Drink.find_by_token(params[:drink_token])
    company = drink.company
    company.update_attribute(:currently_making_id, drink.id)
    render :json => {:success => true}, :callback => params[:callback]
  end

  private

  def load_drink
    @drink ||= @company.drinks.find(params[:id])
  end

end
