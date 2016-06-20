class CreateCharges < ActiveRecord::Migration
  def change
    create_table :charges do |t|
      t.string :customer
      t.string :invoice
      t.float :amount
    end
  end
end
