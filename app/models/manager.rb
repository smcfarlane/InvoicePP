class Manager < ActiveRecord::Base
  has_many :clients
  belongs_to :detail
end
