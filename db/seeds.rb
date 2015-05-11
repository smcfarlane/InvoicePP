# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
user = User.find(1)

vendor = Vendor.create!(
                    name: "Engineer 1",
                    role: "engineer",
                    active: true,
                    contact: "Joe Bob",
                    email: "jbob@engineers.com",
                    phone_number: "5555678901",
                    street_address: "123 A st",
                    city: "San Deigo",
                    zip: "90000",
)

manager = Manager.create!(
                   name: "Sally John",
                   email: "sjohn@manager.com",
                   street_address: "234 C st",
                   city: "San Deigo",
                   zip: "90000",
                   phone_number: "5550987654",
                   user: user
)

client = Client.create!(
                   name: "Big Client",
                   contact: "John Deer",
                   street_address: "321 B st",
                   city: "San Deigo",
                   zip: "90000",
                   phone_number: "5551234567",
                   email: "john@client.com"
)

project = Project.create!(
                   name: "Project 1",
                   identifier: "123-123-123",
                   client: client
)

client_invoice = ClientInvoice.create!(
                    client: client,
                    project: project,
                    user: user,
                    total: 400000,
                    flat_fee: false,
                    paid: false
)

vendor_invoice = VendorInvoice.create!(
                    vendor: vendor,
                    project: project,
                    total: 200000,
                    flat_fee: false,
                    enderted: false,
                    paid: false
)

line_items = LineItem.create!(
                   item: "service 1",
                   value: 200000,
                   client_invoice: client_invoice
)

vendor_line_item = VendorLineItem.create!(
                   item: "needed service",
                   value: 2000000,
                   vender_invoice: vendor_invoice
)