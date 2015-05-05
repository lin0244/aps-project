class CreateProductions < ActiveRecord::Migration
  def change
    create_table :productions do |t|

      t.timestamps null: false
    end
  end
end
