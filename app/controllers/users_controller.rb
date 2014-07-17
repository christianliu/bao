class UsersController < ApplicationController
  def new
      @event = Event.find(params[:id])
      @user = User.new
  end

  def create
    if User.find_by(email: user_params[:email].strip)
      @user = User.find_by(email: user_params[:email].strip)
      @user.update_attributes(name: user_params[:name].strip.titleize)
      flash[:success] = "Welcome back, " + user_params[:name].strip.titleize + "!"
    else
      @user = User.create(name: user_params[:name].strip.titleize, email: user_params[:email].strip)
      flash[:success] = "Hello, " + user_params[:name].strip.titleize + "!"
    end
    
    redirect_to new_trip_path(user_id: @user.id, event_id: params[:user][:event_id])
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :event_id)
  end
end
