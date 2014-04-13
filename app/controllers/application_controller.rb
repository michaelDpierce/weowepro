class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_filter :authenticate_user!
  around_filter :dealer_time_zone, if: :current_user

  private

  def dealer_time_zone(&block)
    Time.use_zone(current_user.dealer.time_zone, &block)
  end

  def after_sign_out_path_for(resource_or_scope)
    new_user_session_path
  end

end
