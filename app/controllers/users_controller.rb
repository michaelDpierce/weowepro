class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    if stale?(users_index)
      respond_to do |format|
        format.html
        format.json { render json: users_index }
        format.csv { render csv: users_index, filename: 'users' }
      end
    end
  end

  def edit
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(user_params)
    @user.skip_confirmation!
    @user.password = params[:password]
    @user.password_confirmation = params[:password_confirmation]
    @user.dealer_id = current_user.dealer_id
    @user.save!
    if @user.save
      render json: @user.as_json
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def update
    @user.password = params[:password]
    @user.password_confirmation = params[:password_confirmation]
    @user.save!
    if @user.update_attributes(user_params)
      render json: @user.as_json
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @user.destroy
    render json: 'success'
  end

  def show
  end

  private

  include UsersHelper

  def users_index
    User.where(dealer_id: current_user.dealer_id)
        .select('id', 'last_name', 'first_name', 'email', 'phone_number',
                'department', 'active', 'admin').as_json
  end

  def set_user
    @user = User.find(params[:id])
  end
end
