class Patient < ApplicationRecord
	has_many :appointments
	has_many :attorneys, inverse_of: :patient, dependent: :destroy
	has_many :adjusters 
	validates :ssn, uniqueness: true
	accepts_nested_attributes_for :attorneys, allow_destroy: true

	def self.search(search)
	  if search
	    where('name LIKE ?', "%#{search}%")
	  else
	    all
	  end
	end
end
