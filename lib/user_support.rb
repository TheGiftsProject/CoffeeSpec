module UserSupport
  def sign_in(user)
    @_user = user
    session[:user_id] = user.uid
  end

  def sign_out
    @_user = nil
    session[:user_id] = ""
  end

  def current_user
    @_user ||= load_user
  end

  def user_signed_in?
    !!current_user
  end

  protected

  def load_user
    User.find_by_uid(session[:user_id])
  end
end