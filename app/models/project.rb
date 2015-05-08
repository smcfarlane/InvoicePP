class Project < ActiveRecord::Base
  belongs_to :clients
  has_many :vendors, through: :project_vendor
end
