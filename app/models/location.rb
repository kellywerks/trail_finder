class Location < ActiveRecord::Base
  has_many :trails
  validates :city, presence: true
  validates :state, presence: true
end
