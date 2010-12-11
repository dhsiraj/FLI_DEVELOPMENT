class HomeController < ApplicationController
  def index
    @mainblogs = getblogs
  end
  
  def contact
  end

end
