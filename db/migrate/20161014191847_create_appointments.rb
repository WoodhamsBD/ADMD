class CreateAppointments < ActiveRecord::Migration[5.0]
  def change
    create_table :appointments do |t|

    	# Will belong to single Patient - 
    	t.string :office
    	t.string :address
    	t.string :type
    	t.string :status


      t.timestamps
    end
  end
end
