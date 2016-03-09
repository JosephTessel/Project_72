class GuestlistsController < ApplicationController
  def new
    @event = Event.find(params[:event_id])
    @guestlist = Guestlist.new
  end

  def create
    @guestlist = Guestlist.new(guestlist_params)
    @event = Event.find(params[:event_id])
    @guestlist.event = @event
    @guestlist.user = current_user


    if @guestlist.save
      # GuestlistNotifier.new_guestlist(@guestlist).deliver_later
      # flash[:alert] = "Guestlist saved"
      redirect_to event_path(@event.id)
    else
      flash.now[:alert] = @guestlist.errors.full_messages.join(". ")
      redirect_to event_path(@event.id)
    end
  end

  def destroy
    @event = Event.find(params[:event_id])
    @guestlist = Guestlist.find(params[:id])
    if current_user != nil
      if @guestlist.user == current_user || current_user.role == "admin"
        @deleteguestlist = Guestlist.find(params[:user.id]).destroy
        redirect_to event_path(@event)
      else
        redirect_to events_path
        flash[:notice] = "You can't destroy other people's guestlists!"
      end
    end
  end

  protected

  def guestlist_params
    params.permit(:user_id, :event_id)
  end
end
