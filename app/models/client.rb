class Client < ActiveRecord::Base
  has_many :projects
  has_many :client_invoices
  belongs_to :managers
  belongs_to :detail

  validates :active, presence: true
  validates :manager_id, presence: true
  validates :user_id, presence: true
end
