class RenameColumns < ActiveRecord::Migration
  def change
    rename_column :products, :type, :product_type
    rename_column :equipment, :type, :eq_type
  end
end
