class EventDatesController < ApplicationController
	before_action :signed_in_user
	before_action :correct_user
	before_action :guest_user # prevent guests from accessing events methods
	before_action :normal_user, only: :delete # prevent normal user from deleting
	before_action :set_event_date, only: [:edit, :update, :destroy]
	before_action :set_event, only: [:new]

	# GET events/:id/new_item
	def new
		@event_date = EventDate.new
	end

	# GET /event_dates/1/edit
	def edit
		@event = Event.find(@event_date.event_id)
	end

	# POST /event_dates
	def create
		@event_date = EventDate.new(event_date_params)
		@event = Event.find(@event_date.event_id)
		if @event_date.save
		  redirect_to dates_for_event_path(@event), notice: 'Event date was successfully created.'
		else
		  render :new
		end
	end

	# PATCH/PUT /event_dates/1
	def update
		page_no_event_dates = session[:page_no_event_dates]
		@event = Event.find(@event_date.event_id)
		if @event_date.update(update_event_date_params)
		 redirect_to dates_for_event_path(@event, page: page_no_event_dates), notice: 'Event date was successfully updated.'
		else
		  render :edit
		end
	end

	# DELETE /event_dates/1
	def destroy
		@event = Event.find(@event_date.event_id)
		@event_date.destroy

		page_no_event_dates = session[:page_no_event_dates]
		items_no_event_dates = session[:items_no_event_dates]

		if items_no_event_dates > 1 
		  redirect_to dates_for_event_url(@event, page: page_no_event_dates), notice: 'Event date was successfully deleted.'
		elsif page_no_event_dates > 1
		  redirect_to dates_for_event_url(@event, page: page_no_event_dates-1), notice: 'Event date was successfully deleted.' 
		else 
		  redirect_to dates_for_event_url(@event), notice: 'Event date was successfully deleted.' 
		end 
	end

	private
	# Use callbacks to share common setup or constraints between actions.
	def set_event_date
	  @event_date = EventDate.find(params[:id])
	end

	def set_event
	  @event = Event.find(params[:id])
	end

	# Never trust parameters from the scary internet, only allow the white list through.
	def event_date_params
	  params.require(:event_date).permit(:event_id, :event_date)
	end

	def update_event_date_params
	  params.require(:event_date).permit(:event_date)
	end
end
