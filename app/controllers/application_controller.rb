class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session
  #before_action :authenticate
  before_action :set_json_default
  
  protected
  
  def authenticate
    token_str = params[:token]
    token = Token.find_by(token: token_str)
    
    if token.nil? || !token.is_valid?
      render json: { error: "Token invalido"}, status: :unauthorized
    else
      @current_user = token.user
    end
  end
  def set_json_default
    @errors = []
  end
  def error!(message, status)
    @errors << message
    response.status = status
    render template: "api/v1/errors"
  end
  def array_error!(array,status)
    @errors = @errors + array
    response.status = status
    render "api/v1/errors"
  end
end
