class Event < ActiveRecord::Base
  belongs_to :user
  validates :user, presence: true
  acts_as_followable
end
