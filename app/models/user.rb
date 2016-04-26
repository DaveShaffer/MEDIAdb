class User < ActiveRecord::Base
  has_many :dvds, dependent: :destroy
end
