class Tag < ActiveRecord::Base
  has_and_belongs_to_many :trails
  validates :name, presence: true
end
