class CreateBanks < ActiveRecord::Migration
  def change
    create_table :banks do |t|
      t.string :customer
      t.string :invoice
      t.float :amount
      t.integer :user_id
      t.timestamps
    end
  end
end
