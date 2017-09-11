class BaseController < ApplicationController

  def current_user?
    render file: '/public/404' unless current_user
  end

  def index
  end

end
