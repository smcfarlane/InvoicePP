class VendorInvoice < ActiveRecord::Base
  has_many :vendor_line_items
  belongs_to :vendor
end
