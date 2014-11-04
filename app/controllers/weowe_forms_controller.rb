class WeoweFormsController < ApplicationController
  before_action :set_weowe_form, only: [:show, :edit, :update, :destroy,
                                        :print_format]

  def dashboard
  end

  def index
    respond_to do |format|
      format.html
      format.json { render json: weowe_data }
      format.csv { render csv: service_csv, filename: 'service' }
    end
  end

  def pending
    respond_to do |format|
      format.html
      format.csv { render csv: sales_csv, filename: 'sales' }
    end
  end

  def completed
    respond_to do |format|
      format.html
      format.csv { render csv: completed_csv, filename: 'completed' }
    end
  end

  def metrics
    respond_to do |format|
      format.html
      format.json { render json: sales_person_index }
    end
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
    @weowe_form.user_id = current_user.id
    @weowe_form.dealer_id = current_user.dealer_id
    @weowe_form.custom_date = Time.now
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
    @weowe_form.save!
    if @weowe_form.save
      render json: @weowe_form.as_json
    else
      render json: @weowe_form.errors, status: :unprocessable_entity
    end
  end

  def update
    @weowe_form.update_attributes(weowe_form_params)

    if @weowe_form.update_attributes(weowe_form_params)
      render json: @weowe_form.as_json
    else
      render json: @weowe_form.errors, status: :unprocessable_entity
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

  def sales_csv
    WeoweForm.where(dealer_id: current_user.dealer_id, pending: true, completed: false)
  end

  def service_csv
    WeoweForm.where(dealer_id: current_user.dealer_id, pending: false, completed: false)
  end

  def completed_csv
    WeoweForm.where(dealer_id: current_user.dealer_id, pending: false, completed: true)
  end

  def weowe_data
    WeoweForm.where(dealer_id: current_user.dealer_id)
             .select('id',
                     'created_at',
                     'custom_date',
                     'stock_number',
                     'year',
                     'make',
                     'vehicle_model',
                     'color',
                     'customer_last_name',
                     'customer_first_name',
                     'dealer_total_value',
                     'pending',
                     'completed',
                     'assigned_sales_person_id',
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
                     'dealer_actual_1',
                     'dealer_actual_2',
                     'dealer_actual_3',
                     'dealer_actual_4',
                     'dealer_actual_5',
                     'dealer_total_actual',
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

  def set_weowe_form
    @weowe_form = WeoweForm.find(params[:id])
  end
end
