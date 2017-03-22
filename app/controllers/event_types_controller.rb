class EventTypesController < ApplicationController

  before_action :signed_in_user
  before_action :correct_user
  before_action :not_admin_user # restrict
  before_action :set_event_type, only: [:edit, :update, :destroy]

  # GET /event_types
  def index
    @event_types = EventType.all.paginate(page: params[:page], per_page: 5)
    params[:page] ? session[:page_no_event_types_index] = params[:page].to_i : session[:page_no_event_types_index] = 1
    session[:items_no_event_types_index] = @event_types.length    
  end

  # GET /event_types/new
  def new
    @event_type = EventType.new
  end

  # GET /event_types/1/edit
  def edit
  end

  # POST /event_types
  def create
    @event_type = EventType.new(event_type_params)
    if @event_type.save
      redirect_to event_types_path, notice: 'Event type was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /event_types/1
  def update
    if @event_type.update(event_type_params)
      redirect_to event_types_path(page: session[:page_no_event_types_index]), notice: 'Event type was successfully updated.'
    else
      render :edit
    end

  end

  # DELETE /event_types/1

  def destroy
    @event_type.destroy
    page_no_event_types_index = session[:page_no_event_types_index]
    items_no_event_types_index = session[:items_no_event_types_index]  
    if items_no_event_types_index > 1 
      redirect_to event_types_url(page: page_no_event_types_index), notice: 'Item type was successfully deleted.'
    elsif page_no_event_types_index > 1
      redirect_to event_types_url(page: page_no_event_types_index-1), notice: 'Item type was successfully deleted.' 
    else 
      redirect_to event_types_url, notice: 'Item type was successfully deleted.' 
    end 
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event_type
      @event_type = EventType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_type_params
      params.require(:event_type).permit(:event_type_name)
    end


end
