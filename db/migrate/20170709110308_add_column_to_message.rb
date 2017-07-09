class AddColumnToMessage < ActiveRecord::Migration[5.0]
  def change
    add_column :messages, :file_name, :string
  end
end
