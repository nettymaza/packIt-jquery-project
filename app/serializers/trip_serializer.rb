class TripSerializer < ActiveModel::Serializer
  attributes :id, :name, :duration, :start_date
end
