class ItemType < ActiveRecord::Base
  has_many :items
  has_many :event_item_types, inverse_of: :item_type
  has_many :events, through: :event_item_types

  validates :item_type_name, :description, presence: true
  validates :item_type_name, uniqueness: { case_sensitive: false }
end
