class TreesController < ApplicationController
  def new
  	@tree = Tree.new
  end

  def create
    @tree = Tree.create(tree_params)

    redirect_to new_trip_path(user_id: @user.id, event_id: params[:user][:event_id])
  end

  private
  def tree_params
  	params.require(:tree).permit(:name)
  end
end
