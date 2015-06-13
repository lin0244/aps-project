class Project < ActiveRecord::Base
  has_many :productions
  belongs_to :manager, :class_name => "User"
  has_many :users

  def self.find_closest_date(manager_id, eq_ids, user_ids, days_number)
    @manager_projects = Project.where(manager_id: manager_id).all
    @eq_projects = []
    eq_ids.each do |id|
      production = Equipment.find(id).production_id
      unless production.nil?
        @eq_projects << Project.find(production.project_id)
      end
    end
    @users_projects = []
    user_ids.each do |id|
      project = User.find(id).project_id
      unless project.nil?
        @users_projects << Project.find(project)
      end
    end
    @projects = @manager_projects + @eq_projects + @users_projects
    start_date = DateTime.now
    @projects.each do |p|
      until p.separate?(start_date, start_date + days_number)
        start_date += 1.day
      end
    end
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
