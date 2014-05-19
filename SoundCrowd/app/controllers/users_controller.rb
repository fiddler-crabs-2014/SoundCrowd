class UsersController < ApplicationController
  # do we need or want this?
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
    # @user = User.where(id: params[:id]).first => return nil

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
