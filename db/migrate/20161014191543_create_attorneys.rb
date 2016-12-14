class CreateAttorneys < ActiveRecord::Migration[5.0]
  def change
    create_table :attorneys do |t|
    	t.string :name
    	t.string :firm
      t.string :attorney_type
    	t.string :address
    	t.string :phone
    	t.string :fax
      t.integer :patient_id

      t.timestamps
    end
  end
end
