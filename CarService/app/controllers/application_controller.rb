class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private
  
  def current_operator
    @current_operator ||= Operator.find(session[:operator_id]) if session[:operator_id]
  end
  helper_method :current_operator
end
