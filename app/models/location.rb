class Location < ActiveRecord::Base
  has_many :trails
  validates :name, presence: true
end
