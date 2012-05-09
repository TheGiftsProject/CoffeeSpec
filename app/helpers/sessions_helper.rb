module SessionsHelper

  def owner_signed_in?
    user_signed_in? and (@user.present? ? @user == current_user : true)
  end
end
