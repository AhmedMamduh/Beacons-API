class CampaignSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :start_time, :end_time, :enabled
  has_one :beacon
end
