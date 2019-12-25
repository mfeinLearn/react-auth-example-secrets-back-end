class ApplicationController < ActionController::API

# an instance variable is an instance of this ApplicationController
## which is an instance of one request in which it gets cleared out
## after every request if   @current_user does not exist/nil   @current_user
## will assign it to the result of the following -> User.find_by(id: session[:user_id])
## and if we reference @current_user again with in the same request it will be stored with in
## instance variable which saves us a database hit. 
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    !!current_user
  end


end
