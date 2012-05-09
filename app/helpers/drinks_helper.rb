module DrinksHelper

  def token_share_url
    user = @user.presence || current_user
    share_url(:token => user.token)
  end
end
