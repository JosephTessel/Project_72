class MeetusController < ApplicationController
  def index
    @hero = User.all.where("role = hero")
    @heroes = User.where(role: 'hero')


  end
end
