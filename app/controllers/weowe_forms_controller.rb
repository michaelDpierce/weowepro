class WeoweFormsController < ApplicationController
  before_action :set_weowe_form, only: [:show, :edit, :update, :destroy,
                                        :print_format]

  def dashboard
    @activity = WeoweForm.where(dealer_id: current_user.dealer_id)
                         .order('updated_at desc').limit(5)
  end

  def index
    if stale?(weowe_data)
      respond_to do |format|
        format.html
        format.json {render json: weowe_data}
        format.csv {render csv: service_view, filename: 'service'}
      end
    end
  end

  def pending
    if stale?(weowe_data)
      respond_to do |format|
        format.html
        format.csv {render csv: @pending, filename: 'sales'}
      end
    end
  end

  def completed
    if stale?(weowe_data)
      respond_to do |format|
        format.html
        format.csv {render csv: completed_view, filename: 'completed'}
      end
    end
  end

  def metrics
    # if stale?(sales_person_index)
      respond_to do |format|
        format.html
        format.json {render json: sales_person_index}
      end
    # end
  end

  def show
    @skip_footer = true
  end

  def new
    if current_user
      @weowe_form = WeoweForm.new
    else
      redirect_to root_path
    end
  end

  def edit
  end

  def create
    @weowe_form = WeoweForm.new(weowe_form_params)
    create_default_methods
    @weowe_form.save
    message = 'Form was successfully created.'
    handle_action(@weowe_form, message, :new, &:save)
  end

  def update
    @weowe_form.update_attributes(weowe_form_params)
    @weowe_form.dealer_total_value = dealer_sum(@weowe_form.dealer_total_value_1,
                                                @weowe_form.dealer_total_value_2,
                                                @weowe_form.dealer_total_value_3,
                                                @weowe_form.dealer_total_value_4,
                                                @weowe_form.dealer_total_value_5)
    @weowe_form.dealer_wholesale = dealer_sum(@weowe_form.dealer_wholesale_1,
                                              @weowe_form.dealer_wholesale_2,
                                              @weowe_form.dealer_wholesale_3,
                                              @weowe_form.dealer_wholesale_4,
                                              @weowe_form.dealer_wholesale_5)
    message = 'Form updated.'
    handle_action(@weowe_form, message, :edit) do |resource|
      resource.update(weowe_form_params)
    end
  end

  def destroy
    @weowe_form.destroy
    respond_to do |format|
      format.html { redirect_to weowe_forms_url }
      format.json { head :no_content }
    end
  end

  def approve_form
    @weowe_form = WeoweForm.find(params[:id])
    CustomerMailer.form_approved(@weowe_form).deliver
    render :show
  end

  def complete_form
    @weowe_form = WeoweForm.find(params[:id])
    CustomerMailer.form_completed(@weowe_form).deliver
    render :show
  end

  private

  include ApplicationHelper
  include WeoweFormsHelper

  def weowe_data
    WeoweForm.where(dealer_id: current_user.dealer_id)
             .select('id', 'custom_date', 'stock_number', 'year', 'make',
                     'vehicle_model', 'color', 'customer_last_name',
                     'customer_first_name', 'dealer_total_value', 'pending',
                     'completed', 'assigned_sales_person_id',
                     'dealer_wholesale',
                                                            'dealer_total_value_1',
                                                            'dealer_total_value_2',
                                                            'dealer_total_value_3',
                                                            'dealer_total_value_4',
                                                            'dealer_total_value_5',
                                                            'dealer_total_value',
                                                            'dealer_wholesale_1',
                                                            'dealer_wholesale_2',
                                                            'dealer_wholesale_3',
                                                            'dealer_wholesale_4',
                                                            'dealer_wholesale_5',
                                                            'dealer_wholesale',
                                                            'description_1',
                                                            'description_2',
                                                            'description_3',
                                                            'description_4',
                                                            'description_5').as_json
  end

  def sales_person_index
    User.where(dealer_id: current_user.dealer_id, department: 'Sales')
        .select('id', 'last_name', 'first_name', 'phone_number').as_json
  end

  def update_message
    message = 'Weowe form was successfully updated.'
    handle_action(@weowe_form, message, :dashboard) do |resource|
      resource.update(weowe_form_params)
    end
  end

  def set_weowe_form
    @weowe_form = WeoweForm.find(params[:id])
  end

  def create_default_methods
    @weowe_form.dealer_total_value = dealer_sum(@weowe_form.dealer_total_value_1,
                                                @weowe_form.dealer_total_value_2,
                                                @weowe_form.dealer_total_value_3,
                                                @weowe_form.dealer_total_value_4,
                                                @weowe_form.dealer_total_value_5)
    @weowe_form.dealer_wholesale = dealer_sum(@weowe_form.dealer_wholesale_1,
                                              @weowe_form.dealer_wholesale_2,
                                              @weowe_form.dealer_wholesale_3,
                                              @weowe_form.dealer_wholesale_4,
                                              @weowe_form.dealer_wholesale_5)
  end
end
