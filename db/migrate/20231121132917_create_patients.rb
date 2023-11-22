class CreatePatients < ActiveRecord::Migration[7.1]
  def change
    create_table :patients do |t|
      t.string :first_name
      t.string :last_name
      t.string :insurance
      t.string :cured
      t.string :boolean

      t.timestamps
    end
  end
end
