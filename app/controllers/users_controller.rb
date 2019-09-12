class UsersController < ApplicationController
  def show
    @user = User.where(id:current_user.id).first
    @events = Event.all.where(user_id:current_user)
  end
end
