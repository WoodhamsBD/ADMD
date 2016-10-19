class Patient < ApplicationRecord
	has_many :appointments

	validates :ssn, uniqueness: true
end
