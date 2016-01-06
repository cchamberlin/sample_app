class UsersController < ApplicationController

  # A frequent practice is to place the standard CRUD actions 
  # in each controller in the following order: 
  # index, show, new, edit, create, update and destroy.
  
  def show
    @user = User.find(params[:id])
  end
  
  def new
    @user = User.new
  end
  
end
