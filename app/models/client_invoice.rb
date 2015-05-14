class ClientInvoice < ActiveRecord::Base
  has_many :line_items
  belongs_to :projects
  belongs_to :clients
end
