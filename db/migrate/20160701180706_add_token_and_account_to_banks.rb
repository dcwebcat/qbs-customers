class AddTokenAndAccountToBanks < ActiveRecord::Migration
  def change
    add_column :banks, :public_token, :string
    add_column :banks, :account_id, :string
  end
end
