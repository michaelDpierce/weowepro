class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :show]


  def index
    @users = User.all
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

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
            flash[:success] = 'Profile updated'
      redirect_to @user
    else
      render 'edit'
    end
  end

  def create
    @user = User.new(user_params)
    @user.save ? redirect_to_created_user : render('index')
  end

  def show
  end

  def new
    if current_user
      @user = User.new
    else
      @user = User.new
      render layout: 'devise'
    end
  end

  private

  include ApplicationHelper
  include UsersHelper

  def redirect_to_created_user
    flash[:success] = 'You have successfully created a user account!'

    signed_in? ? redirect_to(@user) : sign_in_and_redirect(@user)
  end

  def set_user
    @user = User.find(params[:id])
  end

end
