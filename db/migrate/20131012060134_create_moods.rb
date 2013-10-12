class CreateMoods < ActiveRecord::Migration
  def change
    create_table :moods do |t|
      t.integer :state
      t.integer :user_id

      t.timestamps
    end
  end
end
