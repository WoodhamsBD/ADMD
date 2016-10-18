class CreateAppointments < ActiveRecord::Migration[5.0]
  def change
    create_table :appointments do |t|

      t.string :title
    	t.string :office
    	t.string :address
    	t.string :type
    	t.string :status

    	t.references :patient, foreign_key: true


      t.timestamps
    end
  end
end
