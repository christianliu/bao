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

  def result
    # total attendees
    # total attendees who've taken the quiz
    # total km travelled
    # total trees purchased
    # total pledges made
    # total people who walked/biked
  end

end
