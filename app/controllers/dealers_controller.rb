class DealersController < ApplicationController
  before_action :set_dealer, only: [:show, :edit, :update, :destroy]

  def index
    @dealers = Dealer.all
  end

  def show
  end

  def admin
    @dealer = Dealer.find(current_user.dealer_id)
  end

  def new
    if current_user
      @dealer = Dealer.new
    else
      redirect_to root_path
    end
  end

  def edit
  end

  def create
    @dealer = Dealer.new(dealer_params)

    respond_to do |format|
      if @dealer.save
        format.html { redirect_to @dealer, notice: 'Dealer was successfully created.' }
        format.json { render action: 'show', status: :created, location: @dealer }
      else
        format.html { render action: 'new' }
        format.json { render json: @dealer.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @dealer.update(dealer_params)
        format.html { redirect_to @dealer, notice: 'Dealer was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @dealer.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @dealer.destroy
    respond_to do |format|
      format.html { redirect_to dealers_url }
      format.json { head :no_content }
    end
  end

  private

  include ApplicationHelper
  include DealersHelper

  def set_dealer
    @dealer = Dealer.find(params[:id])
  end

end
