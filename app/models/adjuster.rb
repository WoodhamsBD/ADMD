class Adjuster < ApplicationRecord
	belongs_to :patient, inverse_of: :adjusters
	validates :patient_id, presence: true
end
