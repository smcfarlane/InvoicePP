class ProjectsController < ApplicationController
  layout "dashboard"
  before_action :authenticate_user!
  before_action :managers_and_vendors_only
  include ApplicationHelper

  def index_all
    @title = "All Projects"
    @user_roles = user_type(current_user)
  end

  def index
    @client = Client.find(params[:client_id])
    @projects = @client.projects.where(active: true)
    @title = "Projects for #{@client.detail.name}"
  end

  def show
    @client = Client.find(params[:client_id])
    @project = Project.find(params[:id])
    if !@project.active
      render status: 404
    end
    @title = "Project for #{@client.detail.name}"
  end

  def new
    @client = Client.find(params[:client_id])
    @title = "New Project for #{@client.detail.name}"
  end

  def create
    @client = Client.find(params[:client_id])
    @project = Project.create(
            name: params[:name],
            identifier: params[:identifier],
            details: params[:details],
            client_id: params[:client_id],
            active: true
    )
    @project.save
    redirect_to client_project_path(@client, @project)
  end

  def edit
    @client = Client.find(params[:client_id])
    @project = Project.find(params[:id])
    if !@project.active
      render status: 404
    end
    @title = "Edit Project for #{@client.detail.name}"
  end

  def update
    @client = Client.find(params[:client_id])
    @project = Project.find(params[:id])
    @project.name = params[:name]
    @project.identifier = params[:identifier]
    @project.details = params[:details]
    @project.save
    redirect_to client_project_path(@client, @project)
  end

  def destroy
    @client = Client.find(params[:client_id])
    @project = Project.find(params[:id])
    @project.active = false
    @project.save
    redirect_to client_projects_path(@client)
  end

  private

  def managers_and_vendors_only
    unless current_user.has_role?("Manager") || current_user.has_role?("Vendor")
      render status: :forbidden
    end
  end

end
