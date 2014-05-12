class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
    Time.zone = 'America/Los_Angeles' 
  Time::DATE_FORMATS[:default] = "%B %e, %Y %H:%M:%S"
  
end
