class SessionsController < ApplicationController


  def create
    if @user = User.find_by_email(params[:email])
      if @user.authenticate(params[:password])
        session[:user_id] = @user.id
        redirect_to user_path(@user)
      else
        redirect_to root_path
      end
    else
      redirect_to root_path
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end



end
