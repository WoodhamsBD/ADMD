class Patient < ApplicationRecord
	
	# Relations
	has_many :appointments, inverse_of: :patient, dependent: :destroy 
	has_many :attorneys, inverse_of: :patient, dependent: :destroy
	has_many :adjusters, inverse_of: :patient, dependent: :destroy

	#Validations
	validates :ssn, uniqueness: true
	validates	:name, presence: true
	

	#Nested Edits
	accepts_nested_attributes_for :attorneys, allow_destroy: true
	accepts_nested_attributes_for :adjusters, allow_destroy: true


	# Search Function
	def self.search(search)
	  if search
	    where('name LIKE ?', "%#{search}%")
	  else
	    all
	  end
	end

	
end
