class CreateMaterials < ActiveRecord::Migration
  def change
    create_table :materials do |t|

      t.timestamps null: false
    end
  end
end
