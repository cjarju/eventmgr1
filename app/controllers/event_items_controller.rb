class EventItemsController < ApplicationController

  before_action :signed_in_user
  before_action :correct_user
  before_action :guest_user # prevent guests from accessing events methods
  before_action :normal_user, only: :delete # prevent normal user from deleting
  before_action :set_event_item, only: [:edit, :update, :destroy]
  before_action :set_event, only: [:new, :edit_items, :updates]

  # GET events/:id/new_item
  def new
    @event_item = EventItem.new
  end

  # GET events/:id/edit_items
  def edit_items
    @event_items = @event.event_items
  end

  # GET /event_items/1/edit
  def edit
    @event = Event.find(@event_item.event_id)
  end

  # POST /event_items
  def create
    @event_item = EventItem.new(event_item_params)
    @event = Event.find(@event_item.event_id)
    @item = @event_item.item
    @item_type = ItemType.find(@item.item_type_id)
    @item_count = @event.items.where("item_type_id = ?", @item_type.id).count

    if @event_item.save
      cost1 = @event_item.item.cost1_per_unit; cost2 = @event_item.item.cost2_per_unit; cost3 = @event_item.item.cost3_per_unit
      width = @event_item.item.width; height = @event_item.item.height
      @event_item.update_attributes(cost1_per_unit: cost1, cost2_per_unit: cost2, cost3_per_unit: cost3, width: width, height: height)
      # if this the 1st item in category for event add new event_item_type
      if @item_count < 1
        EventItemType.create(event_id: @event.id, item_type_id: @item_type.id, description: @item_type.description)
      end
      redirect_to items_for_event_path(@event), notice: 'Event item was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /event_items/1
  def update
    page_no_event_items = session[:page_no_event_items]
    @event = Event.find(@event_item.event_id)
    if @event_item.update(update_event_item_params)
     redirect_to items_for_event_path(@event, page: page_no_event_items), notice: 'Event item was successfully updated.'
    else
      render :edit
    end
  end

  # POST /events/update_items
  def updates
    event_items = params[:event_items]
    event_items.each do |event_item|
      @event_item = EventItem.find(event_item[:id])
      @event_item.update_attributes(quantity: event_item[:quantity], days: event_item[:days], cost1_per_unit: event_item[:cost1_per_unit], cost2_per_unit: event_item[:cost2_per_unit], cost3_per_unit: event_item[:cost3_per_unit], width: event_item[:width], height: event_item[:height])
    end
    redirect_to items_for_event_path(@event), notice: 'Event items were successfully updated.'
  end

# DELETE /event_items/1
  def destroy
    @event = Event.find(@event_item.event_id)
    @item = @event_item.item
    @item_type = ItemType.find(@item.item_type_id)
    @item_count = @event.items.where("item_type_id = ?", @item_type.id).count

    @event_item.destroy

    # if that was the last item in category for event then delete event_item_type entry
    if @item_count == 1
      @event_item_type = EventItemType.where("event_id = ? and item_type_id = ?", @event.id, @item_type.id).first
      @event_item_type.destroy
    end
    
    page_no_event_items = session[:page_no_event_items]
    items_no_event_items = session[:items_no_event_items]

    if items_no_event_items > 1 
      redirect_to items_for_event_url(@event, page: page_no_event_items), notice: 'Event itemwas successfully deleted.'
    elsif page_no_event_items > 1
      redirect_to items_for_event_url(@event, page: page_no_event_items-1), notice: 'Event item was successfully deleted.' 
    else 
      redirect_to items_for_event_url(@event), notice: 'Event item was successfully deleted.' 
    end 

    #redirect_to items_for_event_url(@event), notice: 'Event item was successfully deleted.'
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event_item
      @event_item = EventItem.find(params[:id])
    end

    def set_event
      @event = Event.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_item_params
      params.require(:event_item).permit(:event_id, :item_id, :quantity, :days)
    end

    def update_event_item_params
      params.require(:event_item).permit(:quantity, :days, :cost1_per_unit, :cost2_per_unit, :cost3_per_unit, :width, :height)
    end
end

