class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def weixin_agent?
    @weixin_agent = request.env['HTTP_USER_AGENT'] =~ /MicroMessenger/
  end
  
end
