class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_filter :authenticate_user!, :except => [:new, :create]
  around_filter :dealer_time_zone, if: :current_user

  private

   def dealer_time_zone(&block)
    Time.use_zone(current_user.dealer.time_zone, &block)
  end
end
