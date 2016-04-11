class EventsController < ApplicationController
  def index
    @events= Event.all
    if @user != nil
      unless current_user.role == "admin"
        flash[:notice] = "You are not authorized to view this page."
      end
    else

    Event.where(verified: 'false')
    end
  end

  def new
  if current_user == nil
    redirect_to new_user_session_path
  end
  @event = Event.new
  end

  def edit
    @event = Event.find(params[:id])
    if current_user == nil
      redirect_to root_path
      flash[:notice] = "You are not authorized to view this!"
    else
      unless current_user.role == "admin" || @event.user == current_user
        redirect_to root_path
        flash[:notice] = "You can't edit other people's work!"
      end
    end
  end

  def show
    @event = Event.find(params[:id])
    if @event.verified != 1
      redirect_to root_path
    else
      @user = current_user
      @guestlist = Guestlist.new
      @guestlists = @event.guestlists.order(created_at: :desc)
      if @user != nil
        @event.guestlists.each do |f|
          @user_on_list = @event.guestlists.where(f.user_id == current_user.id)
        end
      end
    end
  end

  def create
    @event = Event.new(event_params)
    @event.user_id = current_user.id
    if @event.save
     flash[:notice] = "Event Submitted!"
     redirect_to root_path
    else
     render :new
    end
  end

  def update
    @event = Event.find(params[:id])
    if current_user == nil
      redirect_to root_path
      flash[:notice] = "You can't edit other people's work!"
    else
      unless current_user.role == "admin" || @event.user == current_user
        redirect_to root_path
        flash[:notice] = "You can't edit other people's work!"
      end
    end
    if @event.update(event_params)
      flash[:notice] = 'Event Edited'
      redirect_to event_path(@event)
    else
      flash.now[:alert] = @event.errors.full_messages.join(":( ")
      render :edit
    end
  end

  #
  # def verify
  #   @events = Event.new(event_params)
  #   @event.user_id = current_user.id
  # end
  def event_params
    params.require(:event).permit(:title, :description, :date, :event_image, :verified)
  end

end
