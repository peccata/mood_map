class User < ActiveRecord::Base
  has_many :moods, dependent: :destroy
  attr_accessor :login

  validates :nickname, presence: true, uniqueness: { case_sensitive: false }

  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable, :confirmable

  def self.find_first_by_auth_conditions(warden_conditions)
      conditions = warden_conditions.dup
      if login = conditions.delete(:login)
        where(conditions).where(["lower(nickname) = :value OR lower(email) = :value", { :value => login.downcase }]).first
      else
        where(conditions).first
      end
    end

  def to_param
    nickname
  end

end
