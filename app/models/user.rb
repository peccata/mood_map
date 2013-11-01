class User < ActiveRecord::Base
  has_many :moods, dependent: :destroy

  validates :nickname, presence: true

  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable, :confirmable

  def to_param
    nickname
  end

end
