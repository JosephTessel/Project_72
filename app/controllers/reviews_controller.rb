class ReviewsController < ApplicationController
  def index
    @events= Event.all
    @display = Event.where(verified: 'false')
  end
end
