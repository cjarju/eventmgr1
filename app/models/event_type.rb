class EventType < ActiveRecord::Base
  has_many :events
  validates :event_type_name, presence: true, uniqueness: { case_sensitive: false }
end
