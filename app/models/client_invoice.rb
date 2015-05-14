class ClientInvoice < ActiveRecord::Base
  has_many :line_items
  belongs_to :project
  belongs_to :clients
end
