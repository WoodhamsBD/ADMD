class Attorney < ApplicationRecord
	belongs_to :patient, inverse_of: :attorneys
	validates :patient, presence: true
end
