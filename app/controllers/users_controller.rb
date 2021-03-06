class UsersController < ApplicationController
  def new
      @event = Event.find(params[:event_id])
      @user = User.new
  end

  def create
    @user = User.find_by(email: user_params[:email])
    unless @user
      @user = User.create(user_params)
    end
    session[:user_id] = @user.id
    redirect_to new_event_trip_path
  end

  private
  def user_params
    params.require(:user).permit(:name, :email)
  end
end
