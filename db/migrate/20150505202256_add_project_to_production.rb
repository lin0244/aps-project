class AddProjectToProduction < ActiveRecord::Migration
  def change
    add_column :productions, :project_id, :integer
  end
end
