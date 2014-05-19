class PagesController < ApplicationController
  def home
    if current_user
      redirect_to songs_path
    else
      render :home
    end
  end

end
