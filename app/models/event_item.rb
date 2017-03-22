class EventItem < ActiveRecord::Base
  belongs_to :event, inverse_of: :event_items
  belongs_to :item, inverse_of: :event_items
  has_one :item_type, through: :item

  # If you are going to modify the association (rather than just read from it), then it is a good idea to set 
  # the :inverse_of option on the source association on the join model. This allows associated records to be 
  # built which will automatically create the appropriate join model records when they are saved.

  validates :item_id, presence: true
  validates :event_id, uniqueness: {scope: :item_id}

  # :quantity, :days
  # nested form only updates the reference fields
  # as a result validation of presence can't be applied here
  # use JS and/or HTML 5 validation

  # scopes: commonly-used queries (DRY)
  scope :get_item_count, ->(date_val) { joins(:item)
      			                            .joins("INNER JOIN (SELECT events.id, event_name, event_date FROM events LEFT OUTER JOIN (SELECT event_id, min(event_date) event_date FROM event_dates GROUP BY event_id) AS event_dates ON events.id = event_dates.event_id") 
      			                            .where("event_date::text like ?", date_val)
      			                            .select(:item_id)
      			                            .distinct
      			                            .count }

end

