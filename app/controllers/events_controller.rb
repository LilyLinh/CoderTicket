class EventsController < ApplicationController


  def index
    @events = Event.all   
    @future_events = Event.future
    
  end 
  def self.future
   where("ends_at > ?", Time.now).published 
  end
  
  def self.published
  where.not(published_at: nil)
  end

  def self.in_groups_of
  
  end

  def new
  	@event = Event.new
    render 'new'
  end

  def create
  	@event = Event.new(event_params)
  	if @event.save
      redirect_to create_type_event_tickets_path (@event.id)
  		
  	else
  	    render 'new'
   end
  end	

  def show
    @event = Event.find params[:id]
    
  end
  
   def edit
    @event = Event.find params[:id]
  end

   def created_by_user
    @events = current_user.events
  end

  def xuat_hien
    @event = Event.find params[:id]
     
    if event.present?
      unless event.has_enough_ticket_type?
        raise 'You need to create a ticket type before publishing this event!'
      end
 

    @event.published_at = Time.now
    @event.save
    redirect_to root_path
  end
  
  end
 

   private
    def event_params
      params.require(:event).permit(:name, :venue_id, :starts_at, :ends_at, :category_id, :extended_html_description)
    end
end
