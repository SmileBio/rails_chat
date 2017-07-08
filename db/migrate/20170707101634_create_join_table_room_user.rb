class CreateJoinTableRoomUser < ActiveRecord::Migration[5.0]
  def change
    create_table :rooms_users, id: false do |t|
      t.belongs_to :user, index: true
      t.belongs_to :room, index: true
    end
  end
end
