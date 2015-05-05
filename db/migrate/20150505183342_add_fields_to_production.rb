class AddFieldsToProduction < ActiveRecord::Migration
  def change
    add_column :productions, :product_id, :integer
    add_column :productions, :quantity, :integer
  end
end
