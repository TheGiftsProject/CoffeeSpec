module CompanySupport

  extend ActiveSupport::Concern

  included do
    helper_method :can_view?, :can_edit?, :company_dashboard
    before_filter :load_company, :load_token
  end

  def load_company
    @company = Company.find(params[:company_id] || params[:id])
  rescue ActiveRecord::RecordNotFound
    forbidden
  end

  def load_token
    @token = params[:token] || session[:token]
    session[:token] = @token
    @token
  end

  def can_edit?
    (load_token == @company.edit_token) or
    (user_signed_in? and current_user.company == @company)
  end

  def can_view?
    (load_token == @company.view_token) or can_edit?
  end

  def must_view
    forbidden unless can_view?
  end

  def must_edit
    forbidden unless can_edit?
  end

  def company_dashboard
    company_path(@company)
  end

  private

  def forbidden
    render :template => "application/forbidden"
  end


end