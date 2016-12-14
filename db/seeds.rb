User.create!(name:  "Example User",
             email: "test@test.org",
             password:              "togatoga",
             password_confirmation: "togatoga",
             admin:     true,
             activated: true,
             activated_at: Time.zone.now)

10.times do |a|
	Patient.create!(name: Faker::Name.name,
								street_address: Faker::Address.street_address,
								city: Faker::Address.city,
								state: Faker::Address.state_abbr,
								zip_code: Faker::Address.zip,
								phone: Faker::PhoneNumber::cell_phone,
								ssn: Faker::Medical::SSN.ssn,
								dob: "10/5/1991",
                                                date_of_injury: "9/9/2005",
                                                report_type: "QME",
								employer: "The Moving Company",
								claim_number: "1234567890",
								panel_number: "1234567890",
								wcab_number: "ADJ1234567890",
								notes: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.")
end


Patient.find(1).attorneys.create(name: Faker::Name.name, firm: "Atorney Seed Firm",attorney_type: "Applicant", address: "123 Willoby Lane Albany CA 94706", phone: "555-555-5555", fax: "555-555-5555")
Patient.find(1).attorneys.create(name: Faker::Name.name, firm: "Atorney Seed Firm",attorney_type: "Defense", address: "123 Willoby Lane Albany CA 94706", phone: "555-555-5555", fax: "555-555-5555")

Patient.find(1).adjusters.create(name: Faker::Name.name, agency: "Adjuster Agency", address: "234 Back Mill Rd. Berkeley CA 84565", phone: "555-555-5555", fax: "555-555-5555")

User.create!(name:  "Bryan Woodhams",
             email: "woodhamsbd@gmail.com",
             password:              "togatoga",
             password_confirmation: "togatoga",
             admin:     true,
             activated: true,
             activated_at: Time.zone.now)


User.create!(name:  "Faye Donnelley",
             email: "faye@re-docs.com",
             password:              "fayedonnelley",
             password_confirmation: "fayedonnelley",
             admin:     true,
             activated: true,
             activated_at: Time.zone.now)