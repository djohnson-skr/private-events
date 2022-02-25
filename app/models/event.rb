class Event < ApplicationRecord
  belongs_to :creator, class_name: "User"
  has_many :rsvps, foreign_key: :attended_event_id, class_name: "Rsvp"
  has_many :attendees, through: :rsvps

  validates :name, presence: true

  scope :past_events, -> { where("date < ?", Time.current) }
  scope :upcoming_events, -> { where("date >= ?", Time.current) }

end
