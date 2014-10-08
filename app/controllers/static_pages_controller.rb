class StaticPagesController < ApplicationController
  def staff
    @sales_staff = User.where(dealer_id: current_user.dealer_id, department: 'Sales').sort_by &:last_name
    @completed_forms = WeoweForm.where(dealer_id: current_user.dealer_id, pending: false, completed: true)


  end

  def overall
    @count = LazyHighCharts::HighChart.new('column') do |f|
      f.chart({:defaultSeriesType=>"column" , :margin=> [50, 200, 60, 170]} )
      service = {
       :type=> 'column',
       :name=> 'Sales',
       :data=> [
         ['Sales', WeoweForm.where(dealer_id: current_user.dealer_id, pending: true, completed: false).count],
       ]
      }
      sales = {
       :type=> 'column',
       :name=> 'Service',
       :data=> [
         ['Service', WeoweForm.where(dealer_id: current_user.dealer_id, pending: false, completed: false).count]
       ]
      }
      completed = {
       :type=> 'column',
       :name=> 'Completed',
       :data=> [
         ['Completed', WeoweForm.where(dealer_id: current_user.dealer_id, pending: false, completed: true).count]
       ]
      }
      f.series(service)
      f.series(sales)
      f.series(completed)
      f.options[:title][:text] = ['Total We Owe Forms']
      f.options[:xAxis] = {plot_bands: 'none',
                     categories: ['']}
      f.legend(:layout=> 'horizontal',:style=> {:left=> 'auto', :bottom=> 'auto',:top=> 'auto'})
      f.plot_options({bar: {stacking: 'normal'}})
    end
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
