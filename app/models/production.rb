class Production < ActiveRecord::Base
  has_many :equipment
  has_one :product
end
