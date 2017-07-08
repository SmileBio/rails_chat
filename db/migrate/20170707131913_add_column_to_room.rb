class AddColumnToRoom < ActiveRecord::Migration[5.0]
  def change
    add_column :rooms, :room_type, :integer, index: true
  end
end
