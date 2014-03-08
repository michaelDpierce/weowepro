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
    @user = User.new
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

end
