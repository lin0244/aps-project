class Equipment < ActiveRecord::Base
  enum eq_type: [ :equipment_group1, :equipment_group2, :equipment_group3 ]
end
