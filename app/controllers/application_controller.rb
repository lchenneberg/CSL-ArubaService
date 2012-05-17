class ApplicationController < ActionController::Base
  protect_from_forgery
  #force_ssl
  #http_basic_authenticate_with :name => "frodo", :password => "thering"
  before_filter :authenticate_user!

end
