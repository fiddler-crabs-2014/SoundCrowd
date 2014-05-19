class SessionsController < ApplicationController
  # should have tests
  def new
  end

  def create
    # user strong params method to require [:session]
    @user = User.find_by_email(params[:session][:email])

    # @user.try(:authenticate, params[:session][:password])
    if @user && @user.authenticate(params[:session][:password])
      sign_in(@user)
      redirect_to user_path(@user)
    else
      render "new"
    end
  end

  def destroy
    sign_out
    redirect_to root_url
  end



end
