class StaticPagesController < ApplicationController
  def stats
    @start_date = params[:start_date]
    @end_date = params[:end_date]
    @records = WeoweForm.where(updated_at: @start_date..@end_date)
    @pending = @records.where(pending: true, completed: false)
  end

  def privacy
  end

  def tos
  end

end

