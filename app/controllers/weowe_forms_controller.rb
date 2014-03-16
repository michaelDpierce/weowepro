class WeoweFormsController < ApplicationController
  before_action :set_weowe_form, only: [:show, :edit, :update, :destroy]

  def dashboard
    @activity = WeoweForm.where(dealer_id: current_user.dealer_id)
                         .order('updated_at desc').limit(5)
  end

  def index
    @index = WeoweForm.where(dealer_id: current_user.dealer_id,
                             pending: false, completed: false)
    respond_to { |format| format.html }
    respond_to { |format| format.json }
  end

  def pending
    @pending = WeoweForm.where(dealer_id: current_user.dealer_id,
                               pending: true, completed: false)
    respond_to { |format| format.html }
    respond_to { |format| format.json }
  end

  def completed
    @completed = WeoweForm.where(dealer_id: current_user.dealer_id,
                                 pending: false, completed: true)
    respond_to { |format| format.html }
    respond_to { |format| format.json }
  end

  def show
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

    message = 'Weowe form was successfully created.'
    handle_action(@weowe_form, message, :new, &:save)
  end

  def update
    @weowe_form.update_attributes(weowe_form_params)
    calculate_dealer_total
    update_message
  end

  def destroy
    @weowe_form.destroy
    respond_to do |format|
      format.html { redirect_to weowe_forms_url }
      format.json { head :no_content }
    end
  end

  private

  include ApplicationHelper
  include WeoweFormsHelper

  def update_message
    message = 'Weowe form was successfully updated.'
    handle_action(@weowe_form, message, :edit) do |resource|
      resource.update(weowe_form_params)
    end
  end

  def set_weowe_form
    @weowe_form = WeoweForm.find(params[:id])
  end

  def create_default_methods
    @weowe_form.custom_date = Time.now
    @weowe_form.user_id = current_user.id
    @weowe_form.dealer_id = current_user.dealer_id
    @weowe_form.dealer_total_value =
    calculate_dealer_total
  end

  def calculate_dealer_total
    @weowe_form.dealer_total_value =
    verify_total(@weowe_form.dealer_parts_value,
                 @weowe_form.dealer_labor_value)
  end
end
