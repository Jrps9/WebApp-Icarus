class Reservation < ApplicationRecord
  belongs_to :user
  has_many_attached :photos
  geocoded_by :latitude && :longitude
  after_validation :geocode, if: :will_save_change_to_latitude?, if: :will_save_change_to_longitude?
end
