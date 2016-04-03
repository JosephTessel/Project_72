class EventsController < ApplicationController
  def index
    @events= Event.all
  end

  def new
  if current_user == nil
    redirect_to new_user_session_path

  end
  @event = Event.new
  end

  def show
    @event = Event.find(params[:id])
    @user = current_user
    @guestlist = Guestlist.new
    @guestlists = @event.guestlists.order(created_at: :desc)
    @event.guestlists.each do |f|
      @user_on_list = @event.guestlists.where(f.user_id == current_user.id)
    end
  end

  def create
    @event = Event.new(event_params)
    @event.user_id = current_user.id
    if @event.save
     flash[:notice] = "Event Submitted!"
     redirect_to events_path
    else
     render :new
    end
  end

  def event_params
    params.require(:event).permit(:title, :description, :date)
  end

end
