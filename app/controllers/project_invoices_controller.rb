class ProjectInvoicesController < ApplicationController
  layout "dashboard"
  before_action :authenticate_user!
  before_action :managers_only
  include ApplicationHelper

  def index_all
    @title = "Your Invoices"
    @manager = Manager.find_by_user_id(current_user.id)
  end

  def new_with_project
    @title = "Create a New Invoice"
    @manager = Manager.find_by_user_id(current_user.id)
  end

  def create_with_project
    @project = Project.find(params[:project])
    @invoice = ClientInvoice.create!(
              client_id: @project.client.id,
              project_id: @project.id,
              identifier: params[:identifier],
              due_date: Time.new(params[:due_date][:year], params[:due_date][:month], params[:due_date][:day]),
              active: true
    )
    total = 0
    (params[:num_of_line_items].to_i + 1).times do |n|
      if n != 0
        LineItem.create!(
            item: params["item#{n}"],
            value: params["amount#{n}"].to_i,
            client_invoice_id: @invoice.id
        )
        total += params["amount#{n}"].to_i
      end
    end
    @invoice.total = total
    @invoice.save
    redirect_to project_project_invoices_path(@project)
  end

  def mark_paid
    @invoice = ClientInvoice.find(params[:id])
    @invoice.paid = true
    @invoice.save
    redirect_to :back
  end

  def index
    @project = Project.find(params[:project_id])
    @title = "Invoices for Project: #{@project.name} - #{@project.identifier}"
  end

  def show
    @invoice = ClientInvoice.find(params[:id])
    @manager = Manager.find_by_user_id(current_user.id)
    @title = "Invoice: #{@invoice.identifier}"
  end

  def new
    @title = "Create a New Invoice"
    @manager = Manager.find_by_user_id(current_user.id)
    @project = Project.find(params[:project_id])
  end

  def edit
    @title = "Edit Invoice"
    @project = Project.find(params[:project_id])
    @invoice = ClientInvoice.find(params[:id])
  end

  def update
    @project = Project.find(params[:project_id])
    @invoice = ClientInvoice.update(params[:id].to_i,
        identifier: params[:identifier],
        due_date: Time.new(params[:due_date][:year], params[:due_date][:month], params[:due_date][:day])
    )
    total = 0
    (params[:num_of_line_items].to_i + 1).times do |n|
      if n != 0
        if params["item#{n}-id"]
          LineItem.update(params["item#{n}-id"].to_i,
              item: params["item#{n}"],
              value: params["amount#{n}"].to_i)
        else
          LineItem.create!(
              item: params["item#{n}"],
              value: params["amount#{n}"].to_i,
              client_invoice_id: @invoice.id)
        end
        total += params["amount#{n}"].to_i
      end
    end
    @invoice.total = total
    @invoice.save
    redirect_to project_project_invoices_path(@project)
  end

  def destroy
    @project = Project.find(params[:project_id])
    @invoice = ClientInvoice.find(params[:id])
    @invoice.active = false
    @invoice.save
    redirect_to project_project_invoices_path(@project)
  end

  private

  def managers_only
    unless current_user.has_role? "Manager"
      render status: :forbidden
    end
  end
end
