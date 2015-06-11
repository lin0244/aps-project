class AddProductionIdToEquipment < ActiveRecord::Migration
  def change
    add_column :equipment, :production_id, :integer
  end
end
