class User < ActiveRecord::Base
  has_many :moods, dependent: :destroy

  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable, :confirmable
end
