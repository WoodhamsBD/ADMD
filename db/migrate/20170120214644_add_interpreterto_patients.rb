class AddInterpretertoPatients < ActiveRecord::Migration[5.0]
  def change
  	add_column :patients, :interpreter, :string
  end
end
