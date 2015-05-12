class Project < ActiveRecord::Base
  belongs_to :clients
  has_many :portfolios
  has_many :vendors, through: :portfolios
end
