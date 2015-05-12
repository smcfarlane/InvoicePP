class Portfolio < ActiveRecord::Base
  belongs_to :vendor
  belongs_to :project
end
