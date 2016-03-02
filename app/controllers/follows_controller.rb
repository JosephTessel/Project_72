class FollowsController < ApplicationController
  before_action :authenticate_user!
  respond_to :js

  def create
    @event = Event.find(params[:event_id])
    current_user.follow(@event)
  end

  def destroy
    @event = Event.find(params[:event_id])
    current_user.stop_following(@event)
  end
end
