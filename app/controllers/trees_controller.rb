class TreesController < ApplicationController
  def new
    @tree = Tree.new
  end

  def create
    @tree = Tree.create(tree_params)

    redirect_to Event.find(params[:tree][:event_id])
  end

  private
  def tree_params
  	params.require(:tree).permit(:rand_given, :user_id, :event_id)
  end
end
