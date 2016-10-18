class Appointment < ApplicationRecord
	belongs_to :patient
	validates :user_id, presence: true
end
