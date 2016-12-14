class CreateAppointments < ActiveRecord::Migration[5.0]
  def change
    create_table :appointments do |t|

    	t.string :office
    	t.string :address
    	t.string :appointment_type
    	t.string :status
      t.datetime :start_time

    	t.references :patient, foreign_key: true


      t.timestamps
    end
  end
end
