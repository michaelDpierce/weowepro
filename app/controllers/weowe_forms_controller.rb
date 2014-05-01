class WeoweFormsController < ApplicationController
  before_action :set_weowe_form, only: [:show, :edit, :update, :destroy,
                                        :print_format]

  def dashboard
    @activity = WeoweForm.where(dealer_id: current_user.dealer_id)
                         .order('updated_at desc').limit(5)
  end

  def index
    index_view
    if stale?(@completed)
      respond_to do |format|
        format.html
        format.json do
          render json: @index.to_json
        end
        format.csv do
          render csv: @index, filename: 'service'
        end
      end
    end
  end

  def pending
    pending_view
    if stale?(@pending)
      respond_to do |format|
        format.html
        format.json do
          render json: Oj.dump(@pending.select([:id, :custom_date, :stock_number, :year, :make, :vehicle_model, :color, :customer_last_name, :customer_first_name, :dealer_total_value]), mode: :compat)
        end
        format.csv do
          render csv: @pending, filename: 'sales'
        end
      end
    end
  end

  def completed
    completed_view
    if stale?(@completed)
      respond_to do |format|
        format.html
        format.json
        format.csv do
          render csv: @completed, filename: 'completed'
        end
      end
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
    create_default_methods
    if @weowe_form.save
      render :show
    else
      render json: @weowe_form.errors, status: :unprocessable_entity
    end
  end

  def update
    if @weowe_form.update_attributes(weowe_form_params)
      @weowe_form.dealer_total_value = dealer_sum(@weowe_form.dealer_total_value_1,
                                                  @weowe_form.dealer_total_value_2,
                                                  @weowe_form.dealer_total_value_3,
                                                  @weowe_form.dealer_total_value_4,
                                                  @weowe_form.dealer_total_value_5)
      render :show
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

  def index_view
    @index = WeoweForm.where(dealer_id: current_user.dealer_id,
                             pending: false, completed: false)
  end

  def pending_view
    @pending = WeoweForm.where(dealer_id: current_user.dealer_id,
                               pending: true, completed: false)
  end

  def completed_view
    @completed = WeoweForm.where(dealer_id: current_user.dealer_id,
                                 pending: false, completed: true)
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
  end
end
