class Mood < ActiveRecord::Base
  after_create :save_timestamp

  belongs_to :user
  default_scope -> { order('created_at DESC') }
  validates :state, presence: true, inclusion: { in: 1..10 }
  validates :user_id, presence: true
  validates :latitude, presence: true
  validates :longitude, presence: true

  def new_enough?
    created_at > 1.hour.ago
  end

  def to_param
    timestamp
  end

  private

  def save_timestamp
    self.update_column :timestamp, created_at.to_i
  end
end
