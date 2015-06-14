class Product < ActiveRecord::Base
  belongs_to :production
  has_many :materials
  enum product_type: [ :product_group1, :product_group2, :product_group3 ]

  def self.types
    return [ "product_group1", "product_group2", "product_group3" ]
  end
end
