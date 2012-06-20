class CompaniesController < ApplicationController

  include CompanySupport

  before_filter :must_view, :only => [:show]
  before_filter :must_edit, :only => [:update]

  def show
    @drinks = @company.drinks
    @break_room = params.include? "breakroom"
  end

  def update
    if can_edit? and @company.update_attribute(:name, params[:name])
      render :inline => @company.name
    else
      render :nothing => true, :status => :bad_request
    end
  end

  private

end
