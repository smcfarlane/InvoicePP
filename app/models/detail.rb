class Detail < ActiveRecord::Base
  validates :name, :contact, :email, :phone_number, :street_address, :city, :state, :zip, :title, presence: true
  validates :email, uniqueness: true, on: :create
  validates :email, format: {with: %r{\b[A-Z0-9._%+-]+@(?:[A-Z0-9-]+\.)+[A-Z]{2,4}\b}, message: "Submit a vailid email address."}
  validates :state, format: {with: /[A-Z]{2}/, message: "Use the 2 capital letter state code"}
  validates :phone_number, format: {with: /[0-9\-\.\(\)]{10}/, message: "Enter a valid phone number with the area code."}
  validates :zip, format: {with: /\d{5}(?:[-\s]\d{4})?/, message: "Enter a valid zip code, either XXXXX or XXXXX-XXXX."}
end
