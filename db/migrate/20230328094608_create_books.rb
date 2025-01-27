class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books do |t|
      t.string :title
      t.float :price
      t.belongs_to :author, foreign_key: true

      t.timestamps
    end
  end
end
