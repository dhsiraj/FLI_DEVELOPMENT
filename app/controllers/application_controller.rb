class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :getblogs
  @usertype = "Guest"
  def login_required
    if session[:user]
      return true
    end
    flash[:warning]='Please login to continue'
    session[:return_to]=request.request_uri
    redirect_to :controller => "user", :action => "login"
    return false 
  end

  def current_user
    session[:user]
  end

  def redirect_to_stored
    if return_to = session[:return_to]
      session[:return_to]=nil
      redirect_to_url(return_to)
    else
      redirect_to :controller=>'user', :action=>'welcome'
    end
  end
  
    
  private
  def getblogs
    @mainblogs = Blog.all(:limit => 4)
  end
  
  
end