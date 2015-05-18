class DashboardController < ApplicationController
  layout "dashboard"
  before_action :authenticate_user!
  include ApplicationHelper
  def index
    @title = 'Dashboard'
    @u = user_type(current_user)
  end

  def profile

  end
end
