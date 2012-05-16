module CompanySupport

  extend ActiveSupport::Concern

  included do
    helper_method :can_view?, :can_edit?, :company_dashboard
    before_filter :load_company, :load_token
  end

  def load_company
    @company = Company.find(params[:company_id] || params[:id])
  end

  def load_token
    @token = params[:token]
  end

  def can_edit?
    (params[:token] == @company.edit_token) or
    (user_signed_in? and current_user.company == @company)
  end

  def can_view?
    (params[:token] == @company.view_token) or can_edit?
  end

  def company_dashboard
    if @token.present?
      company_path(@company, :token => @token)
    else
      company_path(@company)
    end
  end

end