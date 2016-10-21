class UsersController < ApplicationController

  def new
    @user = User.new #must assign the instance of user
    # render "users/new" 
  end
  
  def create 
    @user = User.new(user_params)

    if @user.save
      flash[:notice] = "Account created. Please log in now." 
      redirect_to @user #user_path(@user) #@user 
    else 
      flash[:alert] = "Error creating account: "
      render "users/new"
    end
  end 

  def show 
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      flash[:notice] = "Account is updated successfully."
      redirect_to user_path(@user) #@user 
    else
      render "users/edit"
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    flash[:notice] = "Account is deleted"
    redirect_to statuses_path #have another look to this
  end

  private 

  def user_params 
    params.require(:user).permit(:name, :email, :password)
  end
end


