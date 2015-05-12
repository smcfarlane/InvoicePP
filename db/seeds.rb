# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.delete_all
Vendor.delete_all
Manager.delete_all
Client.delete_all
Project.delete_all
ClientInvoice.delete_all
VendorInvoice.delete_all
LineItem.delete_all
VendorLineItem.delete_all
Role.delete_all
Detail.delete_all

user_m = User.create!(
    email: "sally@manager.com",
    password: "learn123",
    password_confirmation: "learn123"
)

user_v = User.create!(
    email: "joe@vendor.com",
    password: "learn123",
    password_confirmation: "learn123"
)

user_c = User.create!(
    email: "john@client.com",
    password: "learn123",
    password_confirmation: "learn123"
)

d = Detail.create!(
    name: "Engineer 1",
    contact: "Joe Bob",
    email: "jbob@engineers.com",
    phone_number: "5555678901",
    street_address: "123 A st",
    city: "San Deigo",
    zip: "90000"
)

vendor = Vendor.create!(
    user_id: user_v.id,
    detail_id: d.id
)

r1 = Role.create!(
    role: "Vendor",
    user_id: user_v.id,
    ref_id: vendor.id
)

d = Detail.create!(
    name: "Sally John",
    email: "sjohn@manager.com",
    street_address: "234 C st",
    city: "San Deigo",
    zip: "90000",
    phone_number: "5550987654",
)

manager = Manager.create!(
    user_id: user_m.id,
    detail_id: d.id
)

r2 = Role.create!(
    role: "Manager",
    user_id: user_m.id,
    ref_id: manager.id
)

d = Detail.create!(
    name: "Big Client",
    contact: "John Deer",
    street_address: "321 B st",
    city: "San Deigo",
    zip: "90000",
    phone_number: "5551234567",
    email: "john@client.com",
)

client = Client.create!(
     detail_id: d.id,
     manager_id: manager.id,
     user_id: user_c.id,
     active: true
)

r3 = Role.create!(
    role: "Client",
    user_id: user_c.id,
    ref_id: client.id
)

project = Project.create!(
     name: "Project 1",
     identifier: "123-123-123",
     client_id: client.id
)

vendor.portfolios.create!(
      project_id: project.id
)

client_invoice = ClientInvoice.create!(
      client_id: client.id,
      project_id: project.id,
      user_id: user_m.id,
      total: 400000,
      flat_fee: false,
      paid: false
)

vendor_invoice = VendorInvoice.create!(
      vendor_id: vendor.id,
      project_id: project.id,
      total: 200000,
      flat_fee: false,
      entered: false,
      paid: false
)

line_items = LineItem.create!(
     item: "service 1",
     value: 200000,
     client_invoices_id: client_invoice.id
)

vendor_line_item = VendorLineItem.create!(
     item: "needed service",
     value: 2000000,
     vendor_invoices_id: vendor_invoice.id
)