class AddColumnToRoom < ActiveRecord::Migration[5.0]
  def change
    add_column :rooms, :type, :string, index: true
    add_reference :rooms, :owner, index: true
  end
end
