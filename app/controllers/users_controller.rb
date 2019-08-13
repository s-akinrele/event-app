class UsersController < ApplicationController
  def index
    @users = User.all
    json_response(@users)
  end

  def create
    user = User.new(user_params)
    user.save!
    json_response(user, :created)
  end

  def update

  end

  private

  def user_params
    params.require(:users).permit(
      :first_name,
      :last_name,
      :email,
      :gender,
      :birthdate,
      :phone_number
    )
  end
end
