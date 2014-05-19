require 'sound_cloud_service'

class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper

  def sound_cloud
    @sound_cloud ||= SoundCloudService.new
  end

  def sign_in(user)
    session[:user_id] = user.id
    self.current_user = user
  end

  def signed_in?
      !current_user.nil?
  end
  helper_method :signed_in? # make this available to helpers

  def current_user=(user)
    @current_user = user
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end
  helper_method :current_user

  def sign_out
    session.clear
    self.current_user = nil
  end

  def signed_in_user
    unless signed_in?
      flash[:notice] = "Please sign in."
      redirect_to signin_url
    end
  end
end
