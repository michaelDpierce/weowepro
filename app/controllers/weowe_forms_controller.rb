class WeoweFormsController < ApplicationController
  before_action :set_weowe_form, only: [:show, :edit, :update, :destroy,
                                        :print_format]

  def dashboard
    @activity = WeoweForm.where(dealer_id: current_user.dealer_id)
                         .order('updated_at desc').limit(5)
  end

  def index
    index_view
    respond_to do |format|
      format.html
      format.json
      format.csv do
        render csv: @index, filename: 'service'
      end
    end
  end

  def pending
    pending_view
    respond_to do |format|
      format.html
      format.json
      format.csv do
        render csv: @pending, filename: 'sales'
      end
    end
  end

  def completed
    completed_view
    respond_to do |format|
      format.html
      format.json
      format.csv do
        render csv: @completed, filename: 'completed'
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
      @weowe_form.dealer_id = current_user.dealer_id
      @weowe_form.dealer_total_value = dealer_sum(@weowe_form.dealer_total_value_1,
                                                  @weowe_form.dealer_total_value_2,
                                                  @weowe_form.dealer_total_value_3,
                                                  @weowe_form.dealer_total_value_4,
                                                  @weowe_form.dealer_total_value_5)
      message = 'Weowe form was successfully updated.'

      if @weowe_form.pending == false && @weowe_form.completed == false
        @approved = WeoweForm.new(:approved_trigger => params[:approved_trigger])
        if @weowe_form.update_attributes(params[@approved])
          CustomerMailer.form_approved(@weowe_form, email_domain_handler).deliver
        end
      end

      if @weowe_form.pending == false && @weowe_form.completed == true
        @completed = WeoweForm.new(:completed_trigger => params[:completed_trigger])
        if @weowe_form.update_attributes(params[@completed])
          CustomerMailer.form_completed(@weowe_form, email_domain_handler).deliver
        end
      end

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
    @weowe_form.custom_date = Time.now
    @weowe_form.user_id = current_user.id
    @weowe_form.dealer_id = current_user.dealer_id
    @weowe_form.dealer_total_value = dealer_sum(@weowe_form.dealer_total_value_1,
                                                @weowe_form.dealer_total_value_2,
                                                @weowe_form.dealer_total_value_3,
                                                @weowe_form.dealer_total_value_4,
                                                @weowe_form.dealer_total_value_5)
  end

  def email_domain_handler
    @dealer_id = current_user.dealer_id
    @dealer = Dealer.find(@dealer_id)
    @dealer.email_domain? ? @dealer.email_domain : '@weowepro.com'
  end

end
