class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
      t.belongs_to :user, index: true
      t.belongs_to :room, index: true
      t.string :context
      t.timestamps
    end
  end
end
