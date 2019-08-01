class WelcomeController < ApplicationController

  def home
    if user_signed_in?
      redirect_to activities_path
    else
      redirect_to :controller =>'welcome', :action =>'welcome'
    end
  end

  def welcome
  end  

  def about
  end

end
