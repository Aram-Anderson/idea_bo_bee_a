class Admin::BaseController < ApplicationController
  before_action :user_admin?

  def user_admin?
    render file: '/public/404' unless current_admin?
  end
end
