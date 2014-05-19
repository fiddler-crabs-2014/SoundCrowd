class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def show
    begin 
      @user = User.find(params[:id])
    rescue
      redirect_to root_path
    end
  end


  private

  def user_params
    params.require(:user).permit(:email, :password)
  end



end
