class EventsController < ApplicationController
  def show
  	@event = Event.find(params[:id])
  	@user = User.new
  end

  def index
    @events = Event.all
    # @events = Event.where("title like %#{params[:events_search]}%")
  end

  def new
  end

  def create
  end
end
