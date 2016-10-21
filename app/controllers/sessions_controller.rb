# require_relative "helpers/users_helper.rb"
include UsersHelper


class SessionsController < ApplicationController

  def new
    render "sessions/new"
  end

  def create
   @user = User.find_by(email: params[:email]) #find the user by email
   # @statuses = current_user.statuses.all

   if @user && @user.authenticate(params[:password]) 
      log_in #assign the user with that specific id with a session id
      flash[:notice] = "Welcome, joshhhh@nextacademy.com!"
      
      redirect_to statuses_path #this is an index page
    else
      flash[:alert] = "Please log in again"
      render "sessions/new"
    end
  end

  def destroy
    current_user #so that it knows which user's session to delete
    log_out #this method should destroy the session
    redirect_to root_path
  end


end
