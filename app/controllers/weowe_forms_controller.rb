class WeoweFormsController < ApplicationController
  before_action :set_weowe_form, only: [:show, :edit, :update, :destroy]

  def dashboard
    @activity = WeoweForm.where(dealer_id: current_user.dealer_id)
                         .order('updated_at desc').limit(5)
  end

  def index
    @index = WeoweForm.where(dealer_id: current_user.dealer_id,
                             pending: false, completed: false)
    respond_to do |format|
      format.html
      format.json
    end
  end

  def pending
    @pending = WeoweForm.where(dealer_id: current_user.dealer_id,
                               pending: true, completed: false)
    respond_to do |format|
      format.html
      format.json
    end
  end

  def completed
    @completed = WeoweForm.where(dealer_id: current_user.dealer_id,
                                 pending: false, completed: true)
    respond_to do |format|
      format.html
      format.json
    end
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
    @weowe_form.custom_date = Time.now
    @weowe_form.user_id = current_user.id
    @weowe_form.dealer_total_value = verify_total(@weowe_form.dealer_parts_value, @weowe_form.dealer_labor_value)
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

  def set_weowe_form
    @weowe_form = WeoweForm.find(params[:id])
  end
end
