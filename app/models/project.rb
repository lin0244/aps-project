class Project < ActiveRecord::Base
  has_many :productions
  belongs_to :manager, :class_name => "User"

  def self.check(params)
    puts params
  end
end
