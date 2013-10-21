class AddTimestampToMoods < ActiveRecord::Migration
  def change
    add_column :moods, :timestamp, :integer
    remove_index :moods, [:user_id, :created_at]
    add_index :moods, [:user_id, :timestamp]
  end

end
