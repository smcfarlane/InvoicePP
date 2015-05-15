class Manager < ActiveRecord::Base
  has_many :clients
  belongs_to :detail
  has_many :projects, through: :clients
  has_many :vendors, foreign_key: :created_by
end
