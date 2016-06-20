class AddTimestampsToCharges < ActiveRecord::Migration
  def change
    add_column(:charges, :created_at, :datetime)
  end
end
