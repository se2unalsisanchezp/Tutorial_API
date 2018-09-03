class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :name
      t.integer :code
      t.boolean :available
      t.integer :year

      t.timestamps
    end
  end
end
