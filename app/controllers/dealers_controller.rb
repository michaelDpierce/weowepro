class DealersController < ApplicationController
  before_action :set_dealer, only: [:show, :edit, :update, :destroy]

  def index
    redirect_to root_path
  end

  def show
  end

  def admin
    if stale?(@dealer)
      @dealer = Dealer.find(current_user.dealer_id)
    end
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
    message = 'Dealer was successfully created.'
    handle_action(@dealer, message, :new, &:save)
  end

  def update
    message = 'Dealer was successfully updated.'

    handle_action(@dealer, message, admin_path) do |resource|
      resource.update(dealer_params)
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
