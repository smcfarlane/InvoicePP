class VendorsController < ApplicationController
  layout "dashboard"
  before_action :authenticate_user!
  before_action :managers_only
  include ApplicationHelper

  def index
    @manager = Manager.find_by_user_id(current_user.id)
    @clients = @manager.clients
    @vendors = @manager.vendors.where(active: true)
    @title = "Vendors"
  end

  def show
    @vendor = Vendor.find(params[:id])
    @manager = Manager.find_by_user_id(current_user.id)
    @title = "Vendor: #{@vendor.detail.name}"
  end

  def new
    @title = "New Vendor"
  end

  def create
    @manager = Manager.find_by_user_id(current_user.id)
    @detail = Detail.create(
            name: params[:name],
            contact: params[:contact],
            email: params[:email],
            phone_number: params[:phone],
            street_address: params[:street],
            city: params[:city],
            state: params[:state],
            zip: params[:zip],
            title: params[:title]
    )
    @detail.save!
    @vendor = Vendor.create(
            detail_id: @detail.id,
            created_by: @manager.id
    )
    @vendor.save!
    redirect_to vendor_path(@vendor)
  end

  def edit
    @vendor = Vendor.find(params[:id])
    @title = "Edit Vendor"
  end

  def update
    @vendor = Vendor.find(params[:id])
    @detail = @vendor.detail
    @detail.name = params[:name]
    @detail.contact = params[:contact]
    @detail.email = params[:email]
    @detail.phone_number = params[:phone]
    @detail.street_address = params[:street]
    @detail.city = params[:city]
    @detail.state = params[:state]
    @detail.zip = params[:zip]
    @detail.title = params[:title]
    @detail.save
    redirect_to vendor_path(@vendor)
  end

  def destroy
    @vendor = Vendor.find(params[:id])
    @vendor.active = false
    @vendor.save
    redirect_to vendors_path
  end

  def add_vendor_to_project
    @vendor = Vendor.find(params[:id])
    @project = Project.find(params[:project_id])
    render 403 if !@project.active
    @vendor.projects << @project
    redirect_to vendor_path(@vendor)
  end

  private

  def managers_only
    unless current_user.has_role? "Manager"
      render status: :forbidden
    end
  end
end
