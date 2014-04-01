class UsersController < ApplicationController
  load_and_authorize_resource except: :create
  
  def index
    @users = User.all
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    authorize! :create, @user
    if @user.save
      redirect_to users_path, notice: "User created"
    else
      render :new, notice: "Please try again"
    end
  end
  
  def destroy
    @user = User.find(params[:id]).destroy
    redirect_to users_path, notice: "User deleted"
  end
  
  private
  
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :admin)
  end
end