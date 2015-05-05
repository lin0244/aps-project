class AddFieldsToEquipment < ActiveRecord::Migration
  def change
    add_column :equipment, :name, :string
    add_column :equipment, :type, :integer
  end
end
