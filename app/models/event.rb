class Event < ActiveRecord::Base
  belongs_to :user
  has_many :guestlists, dependent: :destroy
  validates :user, presence: true
  validates :event_image, presence: true
  mount_uploader :event_image, EventImageUploader

end
