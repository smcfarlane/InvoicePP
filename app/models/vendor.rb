class Vendor < ActiveRecord::Base
  has_many :vendor_invoices
  has_many :projects, through: :project_vendor
end
