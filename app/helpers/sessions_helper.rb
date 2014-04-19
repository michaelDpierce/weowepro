module SessionsHelper
  def current_dealer
    current_user.dealer if current_user
  end
end
