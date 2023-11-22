class CreateAppointments < ActiveRecord::Migration[7.1]
  def change
    create_table :appointments do |t|
      t.date :date
      t.string :cause
      t.boolean :urgent

      t.timestamps
    end
  end
end
