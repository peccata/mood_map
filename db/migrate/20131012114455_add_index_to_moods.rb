class AddIndexToMoods < ActiveRecord::Migration
  def change
    add_index :moods, [:user_id, :created_at]
  end
end
