class UsersController < ApplicationController
  def index
  end

  def new
  end

  def create
    if User.find_by(email: user_params[:email]) != nil
      @user = User.find_by(email: user_params[:email])
      @user.update_attributes(name: user_params[:name])
      flash[:success] = "Welcome back, " + user_params[:name] + "!"
    else
      @user = User.create(user_params)
      flash[:success] = "Hello, " + user_params[:name] + "!"
    end
    
    redirect_to new_trip_path
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def user_params
    params.require(:user).permit(:name, :email)
  end
end
