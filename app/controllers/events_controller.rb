class EventsController < ApplicationController
  before_action :current_user, only: %i[index new show create]

  def index
    @past_events = Event.past
    @future_events = Event.upcoming
  end

  def new
    @event = Event.new
  end

  def create
    @event = @current_user.events.build(event_params)
    if @event.save
      flash[:notice] = 'Event created Successfully'
      redirect_to @event
    else
      render :new
    end
  end

  def show
    @event = Event.find(params['id'])
    @attendees = @event.attendees
  end

  private

  def event_params
    params.require(:event).permit(:description, :location, :date)
  end
end
