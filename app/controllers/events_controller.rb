class EventsController < ApplicationController
  def index
    # @events = Event.all
    q = "%#{params[:event_search]}%"
    @events = Event.where("name like ?", q).last(10)
  end

  def show
    # total attendees
    # total people who walked/biked

    @event = Event.find(params[:id])
    info = @event.get_info
    @total_users = info[0]
    @total_carbon = info[1]
    @total_km = info[2]
    @total_trees = info[3]
    @total_pledge = info[4]

    # @grammar = [info[0] == 1, info[1] == 1, info[2] == 1, info[3] == 1, info[4] == 1].map { |value| value ? "has" : "have" }
  
  end

end
