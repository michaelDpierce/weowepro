module SessionsHelper
  def redirect_back_or(default)
    redirect_to(session[:return_to] || default)
    session.delete(:return_to)
  end

  def store_location
    session[:return_to] = request.url if request.get?
  end

  def current_user?(user)
    user == current_user
  end

  def current_dealer
    current_user.dealer if current_user
  end
end
