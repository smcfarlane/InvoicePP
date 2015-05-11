class VendorLineItem < ActiveRecord::Base
  belongs_to :vendor_invoice
end
