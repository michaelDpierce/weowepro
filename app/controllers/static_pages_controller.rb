class StaticPagesController < ApplicationController
  def stats
    @sales = WeoweForm.where(dealer_id: current_user.dealer_id, pending: true, completed: false)
    @service = WeoweForm.where(dealer_id: current_user.dealer_id, pending: false, completed: false)
    @completed = WeoweForm.where(dealer_id: current_user.dealer_id, pending: false, completed: true)
  end

  def privacy
  end

  def tos
  end

  def landing_page
    @skip_footer = false
    render layout: "landing_page"
  end

  def tour
    @skip_footer = true
    render layout: "landing_page"
  end
end

