class Dvd < ActiveRecord::Base
  has_many :videos, dependent: :destroy
  validates :format, presence: true
end
