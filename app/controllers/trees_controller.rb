class TreesController < ApplicationController
  before_action :set_event, only: [:new, :create]

  def new
    @tree = Tree.new
  end

  def create
    @tree = Tree.create(tree_params)

    redirect_to Event.find(params[:tree][:event_id])
  end

  private
  def tree_params
  	params.require(:tree).permit(:rand_given, :user_id)
  end

  def set_event
    @event = Event.find(params[:event_id])
  end
end
