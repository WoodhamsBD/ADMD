class CreatePatients < ActiveRecord::Migration[5.0]
  def change
    create_table :patients do |t|

    	t.string :name
      t.string :street_address
      t.string :city
      t.string :state
      t.string :zip_code
    	t.string :phone
    	t.string :ssn
			t.string :dob
      t.string :date_of_injury
      t.string :report_type
			t.string :employer
			t.string :claim_number
			t.string :panel_number
			t.string :wcab_number
			t.string :notes

      t.timestamps
    end
  end
end
