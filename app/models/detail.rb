class Detail < ActiveRecord::Base
  validates :name, :contact, :email, :phone_number, :street_address, :city, :state, :zip, :title, presence: true
  # validates :email, format: {with: /[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,5}/, message: "Submit a vailid email address."}
  validates :state, format: {with: /[A-Z]{2}/, message: "Use the 2 capital letter state code"}
  validates :phone_number, format: {with: /\d{10}/, message: "Enter a valid phone number with the area code."}
  validates :zip, format: {with: /\d{5}(?:[-\s]\d{4})?/, message: "Enter a valid zip code, either XXXXX or XXXXX-XXXX."}

  def phonenumber=(phonenumber)
    write_attribute(:phonenumber, phonenumber.gsub(/\D/, ''))
  end
end
