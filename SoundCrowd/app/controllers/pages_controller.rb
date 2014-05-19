class PagesController < ApplicationController

  def home
    if current_user
      redirect_to user_path(current_user)
    else
      render :home
    end
  end

end
