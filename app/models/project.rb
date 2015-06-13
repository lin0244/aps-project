class Project < ActiveRecord::Base
  has_many :productions
  belongs_to :manager, :class_name => "User"

  def self.find_closest_date(manager_id, eq_ids, user_ids, days_number)
    @projects = Project.where(manager_id: manager_id).all
    start_date = DateTime.now
    @projects.each do |p|
      until p.separate?(start_date, start_date + days_number)
        start_date += 1.day
      end
    end
    # @eq_projects = []
    # eq_ids.each do |e|




    end_date = start_date + days_number
    return start_date, end_date
  end

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
