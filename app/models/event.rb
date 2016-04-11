class Event < ActiveRecord::Base
  belongs_to :user
  has_many :guestlists, dependent: :destroy
  validates :user, presence: true
  # validates :events_image, presence: true
  # mount_uploader :events_image, EventImageUploader

end
