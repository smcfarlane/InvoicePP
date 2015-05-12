class Vendor < ActiveRecord::Base
  has_many :vendor_invoices
  has_many :portfolios
  has_many :projects, through: :portfolios
  belongs_to :detail
end
