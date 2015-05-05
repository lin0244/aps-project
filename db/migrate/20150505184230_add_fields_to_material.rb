class AddFieldsToMaterial < ActiveRecord::Migration
  def change
    add_column :materials, :name, :string
    add_column :materials, :quantity, :integer
  end
end
