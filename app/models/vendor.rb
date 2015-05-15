class Vendor < ActiveRecord::Base
  has_many :vendor_invoices
  has_many :portfolios
  has_many :projects, through: :portfolios
  belongs_to :detail
  belongs_to :creator, class_name: "Manager", foreign_key: :created_by
end
