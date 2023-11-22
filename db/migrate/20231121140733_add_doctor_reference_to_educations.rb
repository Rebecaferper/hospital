class AddDoctorReferenceToEducations < ActiveRecord::Migration[7.1]
  def change
      add_reference :patients, :intern, foreign_key: true
  end
end
