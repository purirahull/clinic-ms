class CreatePatients < ActiveRecord::Migration[7.1]
  def change
    create_table :patients do |t|
      t.string :name
      t.string :phone_no
      t.references :user, null: false, foreign_key: true
      t.integer :receptionist_id, null: false 
      t.date :appointment_date
      t.integer :age

      t.timestamps
    end
  end
end
