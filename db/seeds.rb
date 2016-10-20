User.create!(name:  "Example User",
             email: "test@test.org",
             password:              "togatoga",
             password_confirmation: "togatoga",
             admin:     true,
             activated: true,
             activated_at: Time.zone.now)

Patient.create!(name: "Johny Appleseed",
								address: "1234 Silly Ave Berkeley CA 94704",
								phone: "5551234567",
								ssn: "000112233",
								dob: "10/5/1991",
								employer: "The Moving Company",
								claim_number: "1234567890",
								panel_number: "1234567890",
								wcab_number: "ADJ1234567890",
								notes: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.")

Appointment.create!(
		)

Attorney.create!(

	)


Adjuster.create!(

	)