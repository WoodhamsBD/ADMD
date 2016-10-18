class CreatePatients < ActiveRecord::Migration[5.0]
  def change
    create_table :patients do |t|

    	t.string :name
    	t.string :address
    	t.string :phone
    	t.string :ssn
			t.string :dob
			t.string :employer
			t.string :claim_number
			t.string :panel_number
			t.string :wcab_number
			t.string :notes

      t.timestamps
    end
  end
end
