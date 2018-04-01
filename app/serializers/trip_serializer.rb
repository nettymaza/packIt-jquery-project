class TripSerializer < ActiveModel::Serializer
  attributes :id, :name, :duration, :start_date
  has_many :items
end
