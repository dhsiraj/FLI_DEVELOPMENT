module ApplicationHelper
  def getusertype
    if session[:user]
      return session[:user].user_type
    else
      return ""
    end
  end
end
