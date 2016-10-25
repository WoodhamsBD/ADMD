class Patient < ApplicationRecord
	has_many :appointments
	has_many :attorneys
	has_many :adjusters 
	validates :ssn, uniqueness: true
	accepts_nested_attributes_for :attorneys, :adjusters
	

	def self.search(search)
	  if search
	    where('name LIKE ?', "%#{search}%")
	  else
	    all
	  end
	end
end
