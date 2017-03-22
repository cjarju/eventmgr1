class EventsController < ApplicationController

  before_action :signed_in_user
  before_action :correct_user
  before_action :guest_user # prevent guests from accessing events methods
  before_action :normal_user, only: :delete # prevent normal user from deleting
  before_action :set_event, only: [:show, :edit, :update, :destroy, :dates, :items, :item_types]

  # GET /events
  def index

    @events = Event.select("*")
              .joins("LEFT OUTER JOIN (SELECT event_id, min(event_date) event_date FROM event_dates GROUP BY event_id) AS event_dates ON events.id = event_dates.event_id")
              .joins("INNER JOIN (SELECT event_id, string_agg(to_char(event_date, 'DD-MM-YY'), ', ') AS formatted_event_date FROM event_dates GROUP BY event_id) AS agg_event_dates ON events.id = agg_event_dates.event_id")
              .order("event_date")
              .paginate(page: params[:page], per_page: 5)

    params[:page] ? session[:page_no_events_index] = params[:page].to_i : session[:page_no_events_index] = 1
    session[:items_no_events_index] = @events.length 
  end

  # GET /events/1
  def show
  end

  # GET /events/new
  def new
    @event = Event.new
    @item_types = ItemType.all
    @items_per_type = []
    @item_types.each do |item_type|
      @items_per_type << item_type.items
    end
  end

  # GET /events/1/edit
  def edit
  end

  # POST /events
  def create
    @event = Event.new(event_item_params)
    if @event.save
      # create event_item_types records
      items = @event.items.select(:item_type_id).distinct(:item_type_id)
      items.each do |item|
        item_type = ItemType.find(item.item_type_id)
        @event.event_item_types.create(item_type_id: item_type.id, description: item_type.description )
      end
      # create event_date records
      event_dates = params[:event_dates]
      event_dates.each do |event_date|
        @event.event_dates.create(event_date: event_date)
      end
      if @event.event_items.count > 0
        # edit the items added for event
        redirect_to edit_event_items_path(@event), notice: 'Event was successfully created.'
      else
        redirect_to events_path, notice: 'Event was successfully created.'
      end
    else
        #flash[:notice] =  @event.errors.full_messages
        #initial variable before rendering template
        @item_types = ItemType.all
        @items_per_type = []
        @item_types.each do |item_type|
          @items_per_type << item_type.items
        end
        render :new
    end

  end

  # PATCH/PUT /events/1
  def update
    if @event.update(event_params)
      redirect_to @event, notice: 'Event was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /events/1
  def destroy
    @event.destroy
    if session[:items_no_events_index] > 1 
      redirect_to events_url(page: session[:page_no_events_index]), notice: 'Event was successfully deleted.'
    elsif session[:page_no_events_index] > 1
      redirect_to events_url(page: session[:page_no_events_index]-1), notice: 'Event was successfully deleted.' 
    else 
      redirect_to events_url, notice: 'Event was successfully deleted.' 
    end 
    #redirect_to events_url, notice: 'Event was successfully deleted.'
  end

  # GET /events/1/dates
  def dates
    @event_dates = @event.event_dates.paginate(page: params[:page], per_page: 5)
    params[:page] ? session[:page_no_event_dates] = params[:page].to_i : session[:page_no_event_dates] = 1
    session[:items_no_event_dates] = @event_dates.length 
  end

  # GET /events/1/items
  def items
    @event_items = @event.event_items.order("id ASC").paginate(page: params[:page], per_page: 5)
    params[:page] ? session[:page_no_event_items] = params[:page].to_i : session[:page_no_event_items] = 1
    session[:items_no_event_items] = @event_items.length 
  end

  # GET /events/1/item_types
  def item_types
    @event_item_types = @event.event_item_types.paginate(page: params[:page], per_page: 5)
    params[:page] ? session[:page_no_event_item_types] = params[:page].to_i : session[:page_no_event_item_types] = 1
    session[:items_no_event_item_types] = @event_item_types.length 
  end

  # GET /events/search
  def search
    @events = Event.select("events.*, formatted_event_date").joins("inner join (SELECT event_id, string_agg(to_char(event_date, 'DD-MM-YY'), ', ') as formatted_event_date FROM event_dates GROUP BY event_id ORDER BY formatted_event_date ASC) as event_dates on events.id = event_id").where("event_name ilike ?", "%#{params[:event_name]}%").paginate(page: params[:page], per_page: 5)
    render :index
  end

  private
  # Use callbacks to share common setup or constraints between actions.

  def set_event
    @event = Event.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def event_item_params
    params.require(:event).permit(:date_requested, :event_name, :organizers, :location, :requested_by, :event_type_id, :perceived_benefits, :goodwill, :item_ids => []  )
  end

  def event_params
    params.require(:event).permit(:date_requested, :event_name, :organizers, :location, :requested_by, :event_type_id, :perceived_benefits, :goodwill )
  end
end

