class AddLatitudeAndLongitudeToMoods < ActiveRecord::Migration
  def change
    add_column :moods, :latitude, :float
    add_column :moods, :longitude, :float
  end
end
