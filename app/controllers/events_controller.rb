class EventsController < ApplicationController
  def show
  	@event = Event.find(params[:id])
  	@user = User.new
  end

  def index
  end

  def new
  end

  def create
  end
end
