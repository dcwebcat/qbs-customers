class CreateReadings < ActiveRecord::Migration
  def change
    create_table :readings do |t|
      t.string :equipment_number
      t.integer :reading_bw, :reading_c1, :reading_c2, :reading_c3
      t.timestamps
      t.integer :user_id
    end
  end
end
