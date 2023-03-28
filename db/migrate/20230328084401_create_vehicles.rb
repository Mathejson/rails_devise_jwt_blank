class CreateVehicles < ActiveRecord::Migration[7.0]
  def change
    create_table :vehicles do |t|
      t.string :name
      t.float :price
      t.string :type

      t.timestamps
    end
  end
end
