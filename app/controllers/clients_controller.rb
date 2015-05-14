class ClientsController < ApplicationController
  layout "dashboard"
  before_action :authenticate_user!
  before_action :managers_only
  include ApplicationHelper

  def index
    @title = "All Clients"
    @manager = Manager.find_by_user_id(current_user.id)
    @clients = Client.where(manager_id: @manager.id, active: true)
  end

  def show
    @client = Client.find(params[:id])
    @title = @client.detail.name
  end

  def new
    @title = "New Client"
  end

  def create
    @detail = Detail.create(
            name: params['name'],
            contact: params['contact'],
            email: params['email'],
            phone_number: params['phone'],
            street_address: params['street'],
            city: params['street'],
            state: params['state'],
            zip: params['zip'],
            title: params['title']
    )
    @detail.save
    @client = Client.create(
            manager_id: Manager.find_by_user_id(current_user.id).id,
            detail_id: @detail.id,
            active: true
    )
    @client.save
    @return = {location: url_for(controller: "clients", action: "index")}
    render json: @return
  end

  def edit
    @client = Client.find(params[:id])
    @title = "Edit Client: #{@client.detail.name}"
  end

  def update
    @client = Client.find(params["id"])
    @detail = @client.detail
    @detail.name = params['name']
    @detail.contact = params['contact']
    @detail.email = params['email']
    @detail.phone_number = params['phone']
    @detail.street_address = params['street']
    @detail.city = params['street']
    @detail.state = params['state']
    @detail.zip = params['zip']
    @detail.title = params['title']
    @detail.save
    @return = {location: url_for(controller: "clients", action: "index")}
    render json: @return
  end

  def destroy
    @client = Client.find(params['id'])
    @client.active = false
    @client.save
    redirect_to action: "index"
  end

  private

  def managers_only
    unless current_user.has_role? "Manager"
      render status: :forbidden
    end
  end
end
