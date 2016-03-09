class Guestlist < ActiveRecord::Base
  belongs_to :event, dependent: :destroy
  belongs_to :user, dependent: :destroy
  validates :user_id, :presence => true
end
