class AddFieldsToPosition < ActiveRecord::Migration
  def change
    add_column :positions, :title, :string
  end
end
