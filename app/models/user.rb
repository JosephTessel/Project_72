class User < ActiveRecord::Base
  has_many :events
  has_many :guestlists, dependent: :destroy

  validates :email, presence: true
  validates :first_name, presence: true, length: { maximum: 50 }
  validates :last_name, presence: true, length: { maximum: 50 }
  validates :phone_number, presence: true, length: { maximum: 11 }

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable



  def admin?
    role == 'admin'
  end
end
