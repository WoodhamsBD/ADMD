class CreateAdjusters < ActiveRecord::Migration[5.0]
  def change
    create_table :adjusters do |t|

    	t.string :name
    	t.string :agency
    	t.string :address
    	t.string :phone
    	t.string :fax
      t.string :patient_id

      t.timestamps
    end
  end
end
