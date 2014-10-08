class StaticPagesController < ApplicationController
  def stats
    # @sales_staff = User.where(dealer_id: current_user.dealer_id, department: 'Sales').sort_by &:last_name
    # @completed_forms = WeoweForm.where(dealer_id: current_user.dealer_id, pending: false, completed: true)
    #
    # @sales = WeoweForm.where(dealer_id: current_user.dealer_id, pending: true, completed: false)
    # @service = WeoweForm.where(dealer_id: current_user.dealer_id, pending: false, completed: false)
    # @completed = WeoweForm.where(dealer_id: current_user.dealer_id, pending: false, completed: true)
  end

  def privacy
  end

  def tos
  end

  def landing_page
    @skip_footer = false
    render layout: 'landing_page'
  end

  def tour
    @skip_footer = true
    render layout: 'landing_page'
  end
end
