class UsersController < ApplicationController
  before_action :find_user, only: [:show, :update, :destroy]

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
    @user.update(user_params)
    head :no_content
  end

  def show
    json_response(@user)
  end

  def destroy
    @user.destroy
    head :no_content
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

  def find_user
    @user = User.find_by(id: params[:id])
  end
end
