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
    binding.pry
    @event = Event.find(params[:event_id])
    @guestlist = @event.guestlists
    @delete_guestlist = Guestlist.find(@event.guestlists.where(@event.guestlists.user == current_user))
  end

  protected

  def guestlist_params
    params.permit(:user_id, :event_id)
  end
end
