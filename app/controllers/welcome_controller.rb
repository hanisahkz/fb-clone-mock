class WelcomeController < ApplicationController

  def index
    current_user #??

    render "welcome/index"
  end
  
end
