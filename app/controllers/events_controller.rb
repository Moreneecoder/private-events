class EventsController < ApplicationController
    before_action :current_user, only: [:index, :new, :show, :create]
    
    def index
      @events = Event.all
    end

    def new
      @event = Event.new
    end

    def create
      @event = @user.events.build(event_params)
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
