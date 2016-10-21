include UsersHelper

class StatusesController < ApplicationController

  def index
    @statuses = Status.all
    render "statuses/index"
  end

  def new
    # @user = User.find(params[:user_id])
    # @user = current_user 
    render "statuses/new"
    @status = Status.new
    @user = @status.user_id
  end

  def create
    # @user = current_user
    @status = current_user.statuses.build(status_params)
    @user = @status.user_id

    if @status.save
      redirect_to status_path(@status)
      flash[:notice] = "Status is created successfully."
    else
      
      render "statuses/new"
      flash[:alert] = "Error creating status."
    end 
  end

  def show 
    @status = Status.find(params[:id])
    # @like = @status.likes.build #need to pass association somehow
  end

  def edit 
    # @user = current_user 
    @status = Status.find(params[:id]) #find the status with that id
    @user = @status.user_id
    render "statuses/edit"
  end

  def update
    # @user = current_user
    @status = Status.find(params[:id])
    @user = @status.user_id

    if @status.update(status_params)
      redirect_to status_path(@status)
      flash[:notice] = "Status is updated successfully."
    else
      render "statuses/edit"
    end
  end

  def destroy
    # @user = current_user
    @status = Status.find(params[:id])
    @user = @status.user_id
    @status.destroy
    redirect_to statuses_path
    flash[:notice] = "Status is deleted."
  end

  private 

  def status_params
    params.require(:status).permit(:title, :content)
  end
end
