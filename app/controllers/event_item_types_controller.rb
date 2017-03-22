class EventItemTypesController < ApplicationController

  before_action :signed_in_user
  before_action :correct_user
  before_action :guest_user # prevent guests from accessing events methods
  before_action :normal_user, only: :delete # prevent normal user from deleting
  before_action :set_event_item_type, only: [:edit, :update]

  # GET /event_item_types/1/edit
  def edit
    @event = @event_item_type.event
  end

  # PATCH/PUT /event_item_types/1
  def update
    page_no_event_item_types = session[:page_no_event_item_types]
    @event = Event.find(@event_item_type.event_id)
    if @event_item_type.update(event_item_type_params)
      redirect_to item_types_for_event_path(@event, page: page_no_event_item_types), notice: 'Event item type was successfully updated.'
    else
      render :edit
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event_item_type
      @event_item_type = EventItemType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_item_type_params
      params.require(:event_item_type).permit(:description)
    end
end
