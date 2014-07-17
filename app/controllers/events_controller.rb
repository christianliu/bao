class EventsController < ApplicationController
  def show
  	@event = Event.find(params[:id])
  	@user = User.new
  end

  def index
    # @events = Event.all
    q = "%#{params[:event_search]}%"
    @events = Event.where("name like ?", q).last(10)
  end

  def new
  end

  def create
  end
end
