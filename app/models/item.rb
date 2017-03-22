class Item < ActiveRecord::Base
  has_many :event_items, inverse_of: :item
  has_many :events, through: :event_items
  belongs_to :item_type

  validates :item_name, :cost1_per_unit, :item_type_id, presence: true
  validates :item_name, uniqueness: {scope: [:item_type_id,:cost1_per_unit], case_sensitive: false}

end
