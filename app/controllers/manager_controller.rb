class ManagerController < ApplicationController
  layout "dashboard"
  before_action :authenticate_user!
  before_action :managers_only
  include ApplicationHelper

  def profile
    @manager = Manager.find_by_user_id(current_user.id)
  end

  def edit

  end

  def update

  end

  private

  def managers_only
    unless current_user.has_role? "Manager"
      render status: :forbidden
    end
  end
end
