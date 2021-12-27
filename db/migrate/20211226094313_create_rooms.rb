class CreateRooms < ActiveRecord::Migration[5.2]
  def change
    create_table :rooms do |t|

      t.timestamps
      t.string :purpose
      t.string :start_at
      t.string :finish_at
      t.string :motorcycle_type
    end
  end
end
