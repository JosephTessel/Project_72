class FollowsController < ApplicationController
  before_action :authenticate_user!
  respond_to :js

  def create
    @user = current_user
    @event = Event.find(params[:event_id])
    @user.follow(@event)
  end

  def destroy
    @user = current_user
    @event = Event.find(params[:event_id])
    @user.stop_following(@event)
  end
end
