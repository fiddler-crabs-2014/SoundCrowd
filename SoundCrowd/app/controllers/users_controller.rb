class UsersController < ApplicationController

  def index
    @user = User.new
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def create_session
    binding.pry
    @user = User.find_by_email params[:user][:email]
    password = params[:password]
    if @user.authenticate(params[:user][:password])
      redirect_to @user
    else
      render :index
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end



end
