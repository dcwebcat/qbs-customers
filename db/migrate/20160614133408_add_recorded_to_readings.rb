class AddRecordedToReadings < ActiveRecord::Migration
  def change
    add_column :readings, :recorded, :boolean, default: false
  end
end
