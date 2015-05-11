class DashboardController < ApplicationController
  layout "dashboard"
  before_action :authenticate_user!
  def index
    @title = 'Dashboard'
    @
  end
end
