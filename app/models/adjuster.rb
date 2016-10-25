class Adjuster < ApplicationRecord
	belongs_to :patient
	validates :patient_id, presence: true
end
