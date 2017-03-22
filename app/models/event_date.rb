class EventDate < ActiveRecord::Base
  belongs_to :event

  validates :event_date, presence: true
  validates :event_id, uniqueness: {scope: :event_date}
end

 