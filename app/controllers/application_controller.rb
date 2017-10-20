class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_action :loggin_user

  def loggin_user
    redirect_to '/login' unless session[:id]
  end
end
