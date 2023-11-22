class AddCuredToPatients < ActiveRecord::Migration[7.1]
  def change
    add_column :patients, :cured, :boolean
  end
end
