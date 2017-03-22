class Event < ActiveRecord::Base
  has_many :event_dates, dependent: :destroy
  has_many :event_items, dependent: :destroy, inverse_of: :event
  has_many :event_item_types, dependent: :destroy
  has_many :items, through: :event_items
  has_many :item_types, through: :event_item_types
  belongs_to :event_type

  # If you are going to modify the association (rather than just read from it), then it is a good idea to set 
  # the :inverse_of option on the source association on the join model. This allows associated records to be 
  # built which will automatically create the appropriate join model records when they are saved.

  accepts_nested_attributes_for :event_items, :reject_if => lambda { |a| a[:content].blank? }, allow_destroy: true

  validates :date_requested, :event_name, :organizers, :location, :requested_by, :perceived_benefits, :goodwill, presence: true

  # scopes: commonly-used queries (DRY) which can be referenced as method calls on the association objects or models. 
    # you can use every model method such as where, joins, includes, etc with scopes 
    # scopes are chainable within scopes 
    # just like where clauses scopes are merged using AND conditions.

  cost_formula = "(quantity * days * event_items.width * event_items.height) * (event_items.cost1_per_unit + event_items.cost2_per_unit + event_items.cost3_per_unit)"
  event_items_types_join_stmt = "INNER JOIN event_item_types on event_item_types.item_type_id = items.item_type_id and event_item_types.event_id = event_items.event_id"
  event_dates_join_stmt = "LEFT OUTER JOIN (SELECT event_id, min(event_date) event_date FROM event_dates GROUP BY event_id) AS event_dates ON events.id = event_dates.event_id"

  scope :get_all, -> { joins(event_dates_join_stmt)}

  scope :get_by_date, ->(date_val) { joins(event_dates_join_stmt)
                                     .where('event_date::text like ?', date_val) }

  scope :total_cost, ->(date_val) { get_by_date(date_val)
                                    .joins(:event_items)
                                    .select("sum("+cost_formula+") as total") }   

  scope :cost_per_event, ->(date_val) { get_by_date(date_val)
                                        .joins(event_items: [item: :item_type])
                                        .group("events.id, events.event_name")
                                        .order("events.id ASC")
                                        .select("events.id, events.event_name, sum("+cost_formula+") as total") }   

  scope :cost_per_item_type, ->(date_val) { get_by_date(date_val)
                                            .joins(event_items: [item: :item_type])
                                            .joins(event_items_types_join_stmt)
                                            .group("item_types.id, item_type_name")
                                            .order("item_types.id ASC")
                                            .select("item_types.id, item_type_name, sum("+cost_formula+") as total") }

end

