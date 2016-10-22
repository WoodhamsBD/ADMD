class Patient < ApplicationRecord
	has_many :appointments

	validates :ssn, uniqueness: true

	def self.search(search)
	  if search
	    where('name LIKE ?', "%#{search}%")
	  else
	    all
	  end
	end
end
