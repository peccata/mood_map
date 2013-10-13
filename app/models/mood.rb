class Mood < ActiveRecord::Base
  belongs_to :user
  default_scope -> { order('created_at DESC') }
  validates :state, presence: true, inclusion: { in: 1..10 }
  validates :user_id, presence: true

  def new_enough?
    ((Time.now - created_at) < 1.hour)
  end

  def timestamp
    created_at.to_i
  end

  def to_param
    timestamp
  end
end
