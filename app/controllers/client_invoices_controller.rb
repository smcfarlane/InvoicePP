class ClientInvoicesController < ApplicationController
  layout "dashboard"
  before_action :authenticate_user!
  before_action :managers_only
  include ApplicationHelper

  def index

  end

  def new
  end

  def create
  end

  private

  def managers_only
    unless current_user.has_role? "Manager"
      render status: :forbidden
    end
  end
end
