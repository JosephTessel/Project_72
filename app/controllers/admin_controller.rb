class AdminController < ApplicationController
  def index
    @events= Event.all
    @users = User.pluck(:first_name, :id)
    if current_user != nil
      if current_user.role != "admin"
        flash[:notice] = "You are not authorized to view this page."
        redirect_to root_path
      elsif current_user.role == "admin"
        @display = Event.where(verified: 0)
      end
    end
  end
end
