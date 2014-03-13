class WeoweFormsController < ApplicationController
  include ApplicationHelper
  include WeoweFormsHelper

  before_action :set_weowe_form, only: [:show, :edit, :update, :destroy]
  helper_method :sort_column, :sort_direction

  def dashboard
    @last_ten = WeoweForm.all.order('id desc').limit(5)
  end

  # GET /weowe_forms
  # GET /weowe_forms.json
  def index
    @index = WeoweForm.all.select(:id, :custom_date, :stock_number, :year,
                                  :make, :vehicle_model, :color,
                                  :customer_last_name, :customer_first_name,
                                  :dealer_total_value, :pending, :completed)
                                  .where(pending: false, completed: false)
    respond_to do |format|
      format.html
      format.json do
        render json:
          @index
      end
    end
  end

  def pending
    @pending = WeoweForm.all.select(:id, :custom_date, :stock_number, :year,
                                  :make, :vehicle_model, :color,
                                  :customer_last_name, :customer_first_name,
                                  :dealer_total_value, :pending, :completed)
                                  .where(pending: true, completed: false)
    respond_to do |format|
      format.html
      format.json do
        render json:
          @pending
      end
    end
  end

  def completed
    @completed = WeoweForm.all.select(:id, :custom_date, :stock_number, :year,
                                  :make, :vehicle_model, :color,
                                  :customer_last_name, :customer_first_name,
                                  :dealer_total_value, :pending, :completed)
                                  .where(pending: false, completed: true)
    respond_to do |format|
      format.html
      format.json do
        render json:
          @completed
      end
    end
  end

  # GET /weowe_forms/1
  # GET /weowe_forms/1.json
  def show
  end

  # GET /weowe_forms/new
  def new
    if current_user
      @weowe_form = WeoweForm.new
    else
      redirect_to root_path
    end
  end

  # GET /weowe_forms/1/edit
  def edit
  end

  # POST /weowe_forms
  # POST /weowe_forms.json
  def create
    @weowe_form = WeoweForm.new(weowe_form_params)
    @weowe_form.custom_date = Time.now
    @weowe_form.user_id = current_user.id
    @weowe_form.dealer_total_value = verify_total(@weowe_form.dealer_parts_value,@weowe_form.dealer_labor_value)
    respond_to do |format|
      if @weowe_form.save
        format.html { redirect_to @weowe_form, notice: 'Weowe form was successfully created.' }
        format.json { render action: 'show', status: :created, location: @weowe_form }
      else
        format.html { render action: 'new' }
        format.json { render json: @weowe_form.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /weowe_forms/1
  # PATCH/PUT /weowe_forms/1.json
  def update
    @weowe_form.update_attributes(weowe_form_params)
    @weowe_form.dealer_total_value = verify_total(@weowe_form.dealer_parts_value,@weowe_form.dealer_labor_value)
    respond_to do |format|
      if @weowe_form.update(weowe_form_params)
        format.html { redirect_to @weowe_form, notice: 'Weowe form was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @weowe_form.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /weowe_forms/1
  # DELETE /weowe_forms/1.json
  def destroy
    @weowe_form.destroy
    respond_to do |format|
      format.html { redirect_to weowe_forms_url }
      format.json { head :no_content }
    end
  end

  private

    def sort_column
      params[:sort] || "customer_last_name"
    end

    def sort_direction
      params[:direction] || "asc"
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_weowe_form
      @weowe_form = WeoweForm.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def weowe_form_params
      params.require(:weowe_form)
      .permit(:customer_first_name, :customer_last_name, :customer_phone_mobile,
              :customer_email, :stock_number, :make, :vehicle_model, :year,
              :sold_date,:weowe_info, :theyowe_info, :customer_signature,
              :custom_date, :color, :dealer_labor_value, :dealer_parts_value,
              :dealer_total_value, :pending, :completed, :user_id, :dealer_id)
    end
end
