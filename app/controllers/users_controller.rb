class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.where(dealer_id: current_user.dealer_id)
    respond_to do |format|
      format.html
      format.json do
        render json:
          @users
      end
    end
  end

  def edit
  end

  def new
    if current_user
      @user = User.new
    else
      @user = User.new
      render layout: 'devise'
    end
  end

  def edit
  end

  def create
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User account was successfully created.' }
        format.json { render action: 'show', status: :created, location: @user }
      else
        format.html { render action: 'new' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @user.update_attributes(user_params)
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'Profile updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
  end

  private

  include ApplicationHelper
  include UsersHelper

  def set_user
    @user = User.find(params[:id])
  end

end
