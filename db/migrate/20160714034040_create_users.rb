class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :remember_digest
      t.string :password_digest
      t.boolean :admin
      t.string :activation_digest
      t.datetime :activated_at
      t.boolean :activated

      t.timestamps
    end
  end
end
