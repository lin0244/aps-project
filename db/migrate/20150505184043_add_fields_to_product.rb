class AddFieldsToProduct < ActiveRecord::Migration
  def change
    add_column :products, :name, :string
    add_column :products, :type, :integer
  end
end
