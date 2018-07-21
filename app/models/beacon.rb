class Beacon < ApplicationRecord
	validates_presence_of :name, :major, :minor
	has_many :campaigns
end
