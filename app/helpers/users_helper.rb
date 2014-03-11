module UsersHelper
  USER_PARAMS = [
    :email, :first_name, :last_name, :phone_number, :dealer_id, :admin
  ]

  def user_params
    params.require(:user).permit(USER_PARAMS)
  end
end
