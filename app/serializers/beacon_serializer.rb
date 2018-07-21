class BeaconSerializer < ActiveModel::Serializer
  attributes :id, :name, :major, :minor, :latitude, :longitude
end
