include UsersHelper 

class LikesController < ApplicationController

  def create
    @status = Status.find_by(params[:status_id])
    @user = current_user
    @like = @status.likes.build
    @likes = @status.likes.all
    # total_likes = 0

    @like.save

    if Like.find_by(status_id: @status.id, user_id: current_user.id)
      # @status.likes.count
      @likes.count
      redirect_to root_path
      flash[:alert] = "You liked before!"
    else
      @like.save
      # total_likes = @status.likes.count
      # total_likes += 1

      redirect_to root_path 
      flash[:notice] = "You liked #{@status.title}!"
    end
  end

  def destroy
    # @like = Like.find(params[:id])
    # @user = @like.user_id
    # @status = @like.status_id

    # @likes = @status.likes.all

    @status = Status.find_by(params[:status_id])
    @user = current_user
    @like = @status.likes.build
    @likes = @status.likes.all

    @like.destroy

    # @likes.count  -= 1
    
    redirect_to status_path(@status)
    flash[:notice] = "You unlike."
  end


end
