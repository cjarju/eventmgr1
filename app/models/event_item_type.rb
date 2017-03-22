class EventItemType < ActiveRecord::Base
  belongs_to :event 
  belongs_to :item_type 

  validates :event_id, :item_type_id, presence: true
end

 