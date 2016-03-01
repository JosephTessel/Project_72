class User < ActiveRecord::Base
  has_many :events
  acts_as_follower
  validates :email, presence: true
  validates :first_name, presence: true, length: { maximum: 50 }
  validates :last_name, presence: true, length: { maximum: 50 }

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable



  def admin?
    role == 'admin'
  end
end
