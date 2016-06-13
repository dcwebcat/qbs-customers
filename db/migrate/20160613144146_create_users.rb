class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :customer_number
      t.string :company
      t.timestamps
      t.boolean :admin, default: false
    end
  end
end
