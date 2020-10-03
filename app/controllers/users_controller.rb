class UsersController < ApplicationController
	before_action :set_user, only: %i[show update destroy]

  def index
    @users = Group.all
    json_response(@users)
  end

  def create
    @user = User.create!(user_params)
    json_response(@group, :created)
  end

  def show
    json_response(@user)
  end

  def update
    @user.update(user_params)
    head :no_content
  end

  def destroy
    @user.destroy
    head :no_content
  end


  private

  def user_params
    params.require(:user).permit(:first_name, :last_name)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
