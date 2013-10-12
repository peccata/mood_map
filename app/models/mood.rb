class Mood < ActiveRecord::Base
  belongs_to :user
  default_scope -> { order('created_at DESC') }
  validates :state, presence: true, inclusion: { in: 1..10 }
  validates :user_id, presence: true
end
