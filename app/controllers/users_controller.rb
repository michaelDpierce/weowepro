class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.where(dealer_id: current_user.dealer_id)
    respond_to do |format|
      format.html
      format.json
    end
  end

  def edit
  end

  def new
    current_user ? @user = User.new : devise_user_render
  end

  def edit
  end

  def create
    @user = User.new(user_params)
    @user.skip_confirmation!
    @user.save!
    @user.dealer_id = current_user.dealer_id
    message = 'User account was successfully created.'
    handle_action(@user, message, :new, &:save)
  end

  def update
    @user.update_attributes(user_params)
    message = 'Profile updated.'
    handle_action(@user, message, :edit) do |resource|
      resource.update(user_params)
    end
  end

  def show
  end

  private

  include ApplicationHelper
  include UsersHelper

  def devise_user_render
    @user = User.new
    render layout: 'devise'
  end

  def set_user
    @user = User.find(params[:id])
  end
end
