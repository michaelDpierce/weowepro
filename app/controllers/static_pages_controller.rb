class StaticPagesController < ApplicationController
  def stats
    @start_date = params[:start_date]
    @end_date = params[:end_date]
    @records = WeoweForm.where(updated_at: @start_date..@end_date)
    @sales = WeoweForm.where(pending: true, completed: false)
    @service = WeoweForm.where(pending: false, completed: false)
    @completed = WeoweForm.where(pending: false, completed: true)
  end

  def privacy
  end

  def tos
  end

end

