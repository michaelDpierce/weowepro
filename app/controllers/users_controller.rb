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

  def set_user
    @user = User.find(params[:id])
  end

end
