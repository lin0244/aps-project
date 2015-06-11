class Project < ActiveRecord::Base
  has_many :productions
  belongs_to :manager, :class_name => "User"

  def self.check(params)
    # @p = Project.where(manager_id: params[:manager_id])
    # @p.each do |p|

    # end
    # puts params
  end

  # def self.test
  #   p1 = Project.first
  #   p2 = Project.last
  #   p1.separate?(p2.start_date, p2.end_date)
  # end

  # method that check if project dates are not overlaping range between given start and end date
  def separate?(start_d, end_d)
    range = start_d..end_d
    check = start_date
    while check < end_date
      return false if range.cover?(check)
      check += 1.day
    end
    return true
  end

end
