class HomeController < ApplicationController
  def index
    @mainblogs = getblogs
  end

end
