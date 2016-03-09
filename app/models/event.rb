class Event < ActiveRecord::Base
  belongs_to :user
  has_many :guestlists, dependent: :destroy
  validates :user, presence: true
  acts_as_followable
end
