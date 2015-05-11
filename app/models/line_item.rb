class LineItem < ActiveRecord::Base
  belongs_to :client_invoice
end
