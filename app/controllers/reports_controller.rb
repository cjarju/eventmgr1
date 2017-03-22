class ReportsController < ApplicationController

  before_action :signed_in_user # user must be signed in
  before_action :correct_user   # signed in user must be current user
  before_action :set_event, only: [:event_info_type, :event_info]
  
  ## class variables 
    # *** note: only instance variables are accessible in view files

  # formula to get cost 
  @@cost_formula = "(quantity * days * event_items.width * event_items.height) * (event_items.cost1_per_unit + event_items.cost2_per_unit + event_items.cost3_per_unit)"
  
  # | event_items - items - event_item_types | join statement 
  @@event_items_types_join_stmt = "INNER JOIN event_item_types on event_item_types.item_type_id = items.item_type_id and event_item_types.event_id = event_items.event_id"

  # full names of the months
  @@month_names = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]

  # short names of the months
  @@month_short_names = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]

  # number id of months 
  @@month_numbers = ["01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12"]

  # GET /events/1/info_type
  def event_info_type
    @event_info_types = EventInfoType.all
  end

  # GET /reports/event_info/1
  def event_info
    
    # format event dates, concat into single string 
    tmp_dates = []
    @event.event_dates.select(:event_date).each do |row|
      tmp_dates << row.event_date.strftime("%d %B %Y")
    end   
    @event_date = tmp_dates.join(', ')

    # item_types for event
    # table: item_type_name, description, total
    @item_types_for_event = EventItem.joins(item: :item_type)
                            .joins(@@event_items_types_join_stmt)
                            .where("event_items.event_id = ?", @event.id)
                            .group("item_types.id, item_type_name, event_item_types.description")
                            .order("item_types.id ASC")
                            .select("item_types.id, item_type_name, event_item_types.description, sum("+@@cost_formula+") as total")

    # total cost for event
    @event_cost = EventItem.where("event_id = ?", @event.id)
                  .select("sum("+@@cost_formula+") as total")
                  .reorder('').first.total

    # for each item_type in event
    # table: item_name, quantity, days, cost1_per_unit, item_total, item_type_total, item_type_name
    @event_items_per_type = []
    @event.item_types.each do |item_type|
              item_type_total = EventItem.joins(item: :item_type)
                                .where("event_id = ? and item_type_id = ?", @event.id, item_type.id)
                                .select("sum("+@@cost_formula+") as total")
                                .reorder('').first
      @event_items_per_type <<  EventItem.joins(item: :item_type)
                                .where("event_id = ? and item_type_id = ?", @event.id, item_type.id)
                                .order("items.id ASC")
                                .select("items.id, item_name, event_items.quantity, event_items.days, event_items.cost1_per_unit, "+@@cost_formula+" as item_total, #{item_type_total.total} as item_type_total, item_type_name")
    end

    if params[:event_info_type_id] == "2" 
      respond_to do |format| 
        format.html {render 'event_form'}
        format.xlsx {render xlsx: 'event_form', filename: @event.event_name.gsub(/[\/:*?"<>|]/,'_')+"_form.xlsx"}
      end  
    elsif  params[:event_info_type_id] == "1"
      respond_to do |format| 
        format.html {render 'event_items'}
        format.xlsx {render xlsx: 'event_items', filename: @event.event_name.gsub(/[\/:*?"<>|]/,'_')+"_items.xlsx"}
      end  
    end

  end

  def select_options
  end

  def select_year
  end

  def summary_info

    @chart = params[:chart]

    # params hash values are strings
    @date = params[:date]
    @year = @date[:year]
    @month_num = @date[:month]

    # prefix 0 to month_num if necessary 
    if @month_num
      @month = sprintf '%02i', @month_num
    end

    # short names of the months
    @month_short_names = @@month_short_names

    # construct the date and month name values
    # index of month name is one less than the month number
    if params[:use_month] == "1"
      @date_val = @year+"-"+@month
      @month_name = @@month_names[@month_num.to_i-1]
    else
      @date_val = @year
      @month_name = ""
    end
    
    # total cost for given date 
    # first() adds ORDER BY and LIMIT clauses. Since the query uses an aggregate function, 
    # the ORDER BY column must appear in the GROUP BY clause or be used in the aggregate function.
    # The query doesn't require a GROUP BY clause. So undo the ORDER BY clause added by first(). 
    total_cost = Event.total_cost(@date_val+"%").reorder('').first.total
    @total_cost = (total_cost.nil?) ? 0 : total_cost

    # cost per event for given date 
      # as: id, event_name, total
    @events = Event.cost_per_event(@date_val+"%")

    # event counts
    @event_counts = @events.length 

    # events chart data
    # hash {"event_name" => cost, ... "event_name" => cost }
    @event_chart_data = {}
    @events.each do |event|
      @event_chart_data[event.event_name] = event.total
    end

    # cost per item_type for a given date 
      # as: id, item_type_name, total
    @item_types = Event.cost_per_item_type(@date_val+"%") 

    # item_type counts
    @item_type_counts = @item_types.length 

    # array of item_types names
    @item_types_names = []
    @item_types.each do |item_type|
      @item_types_names << item_type.item_type_name
    end

    # item types chart data
     # hash {"item_type_name" => cost, ... "item_type_name" => cost }
    @item_types_chart_data = {}
    @item_types.each do |item_type|
      @item_types_chart_data[item_type.item_type_name] = item_type.total
    end

    # for each item_type for a given date 
     # as: item_type_name, item_name, spots, item_total, item_type_total
    @items_per_type = []
    @item_types.each do |item_type|
      item_type_total = Event.get_by_date(@date_val+"%")
                        .joins(event_items: [item: :item_type])
                        .where("item_type_id = ?", item_type.id)
                        .group("item_type_id")
                        .order("item_type_id")
                        .select("item_type_id, sum("+@@cost_formula+") as total")
                        .first
      @items_per_type <<  Event.get_by_date(@date_val+"%")
                          .joins(event_items: [item: :item_type])
                          .where("item_type_id = ?", item_type.id)
                          .group("item_type_name, item_name, items.id")
                          .order("items.id ASC")
                          .select("item_type_name, item_name, items.id, sum(quantity * days) as spots, sum("+@@cost_formula+") as item_total, #{item_type_total.total} as item_type_total")
    end

    # item types by events: for each item_type, for each event for a given date
      # as:
      # [0] => [item_type_name, event1_total, eventN_total, item_type_total]
      # [1] => [item_type_name, event1_total, eventN_total, item_type_total]
      # ...
    @types_by_events = []
    @item_types.each do |item_type|
      type_by_events = []
      type_by_events << item_type.item_type_name
      @events.each do |event|
        type_by_events << Event.get_by_date(@date_val+"%")
                          .joins(event_items: [item: :item_type])
                          .where("event_items.event_id = ? and item_type_id = ?", event.id, item_type.id)
                          .select("sum("+@@cost_formula+") as total")
                          .reorder('').first.total
      end
      type_by_events << Event.get_by_date(@date_val+"%")
                        .joins(event_items: [item: :item_type])
                        .where("item_type_id = ?", item_type.id)
                        .select("sum("+@@cost_formula+") as total")
                        .reorder('').first.total
      @types_by_events <<  type_by_events
    end

    # item_types by items by months: for each item_type, for each item, for each month for a given date 
      # as:
      # [0] =>  [0] => [item_name, jan_total, ..., dece_total, item_total]
      #         [1] => [item_name, jan_total, ..., dece_total, item_total]
      #         ...
      # [1] =>  [0] => [item_name, jan_total, ..., dece_total, item_total]
      #         [1] => [item_name, jan_total, ..., dece_total, item_total]
      #         ...
      # ...
    @types_by_items_by_months = []
    @monthly_totals_for_types = []

    @item_types.each do |item_type|

      items = Event.get_by_date(@date_val+"%")
              .joins(event_items: :item)
              .where("item_type_id = ?", item_type.id)
              .order("item_id ASC")
              .select("item_id, item_name")
              .distinct
                       
      items_in_type = []

      items.each do |item|

        item_by_months = []
        item_by_months << item.item_name

        @@month_numbers.each do |month_number|
          item_by_months << Event.get_by_date(@date_val+"-"+month_number+"%")
                            .joins(event_items: [item: :item_type])
                            .where("item_type_id = ? and item_id = ?", item_type.id, item.item_id)
                            .select("sum("+@@cost_formula+") as total")
                            .reorder('').first.total
        end
        
        # total 
        item_by_months << Event.get_by_date(@date_val+"%")
                          .joins(event_items: [item: :item_type])
                          .where("item_type_id = ? and item_id = ?", item_type.id, item.item_id)
                          .select("sum("+@@cost_formula+") as total")
                          .reorder('').first.total

        items_in_type << item_by_months

      end

      monthly_totals_for_type = []
      monthly_totals_for_type << "Total"
      @@month_numbers.each do |month_number|
        monthly_totals_for_type <<  Event.get_by_date(@date_val+"-"+month_number+"%")
                                    .joins(event_items: [item: :item_type])
                                    .where("item_type_id = ?", item_type.id)
                                    .select("sum("+@@cost_formula+") as total")
                                    .reorder('').first.total
      end

      #total total 
      monthly_totals_for_type <<  Event.get_by_date(@date_val+"%")
                                  .joins(event_items: [item: :item_type])
                                  .where("item_type_id = ?", item_type.id)
                                  .select("sum("+@@cost_formula+") as total")
                                  .reorder('').first.total

      items_in_type << monthly_totals_for_type
      @types_by_items_by_months << items_in_type
      
      # slice 300.000000 
      @monthly_totals_for_types  << monthly_totals_for_type.slice(1..-2)

    end
    
    # monthly costs per item type chart data
    # array of hashes
    #   [0] => hash {"jan" => jan_cost, ... "Dec" => dec_cost}
    #   [1] => hash {"jan" => jan_cost, ... "Dec" => dec_cost}

    @types_by_months_chart_data = []

    @monthly_totals_for_types.each do |monthly_totals_for_type|

      month_index = 0

      monthly_costs_for_type = {}

      monthly_totals_for_type.each do |month_cost|
        monthly_costs_for_type[@@month_short_names[month_index]] = month_cost
        month_index += 1
      end

      @types_by_months_chart_data << monthly_costs_for_type

    end 

    if params[:itemtypesxevents] == "1"
      respond_to do |format| 
        format.html {render 'summary_by_events'}
        format.xlsx {render xlsx: 'summary_by_events', filename: "summary_"+@year.to_s+"_"+@month.gsub(/[\/:*?"<>|]/,'_')+"_item_types_by_events.xlsx"}
      end  
    elsif params[:itemsxmonths] == "1"
      respond_to do |format| 
        format.html {render 'summary_by_months'}
        format.xlsx {render xlsx: 'summary_by_months', filename: "summary_"+@year.to_s.gsub(/[\/:*?"<>|]/,'_')+"_items_by_months.xlsx"}
      end  
    else
      respond_to do |format| 
        format.html {render 'summary'}
        format.xlsx {render xlsx: 'summary', filename: "summary_"+@year.to_s+"_"+@month.gsub(/[\/:*?"<>|]/,'_')+".xlsx"}
      end  
    end

  end

  def summary_final

    # params hash values are strings
    @date = params[:date]
    @year = @date[:year]
    
    # short names of the months
    @month_short_names = @@month_short_names
        
    @report_data_months = [] 
    event_names = []
    event_totals = []
    
    i = 0
    @@month_numbers.each do |month_number|

      @date_val = @year+"-"+month_number
      month_name = @@month_short_names[i]

      # total cost 
      @total_cost = Event.total_cost(@date_val+"%")

      # cost per event for given date 
        # as: id, event_name, total
      @events = Event.cost_per_event(@date_val+"%")
     
      # event counts
      @event_counts = @events.length 

      @events.each do |event|
        event_names << event.event_name 
        event_totals << event.total
      end 
        
      # cost per item_type for a given date 
        # as: id, item_type_name, total
      @item_types = Event.cost_per_item_type(@date_val+"%") 
      
      # item type counts                      
      @item_type_counts = @item_types.length 

      # array of item_types names
      @item_types_names = []
      @item_types.each do |item_type|
        @item_types_names << item_type.item_type_name
      end

      @item_counts = EventItem.get_item_count(@date_val+"%")

      # for each item_type for a given date 
       # as: item_type_name, item_name, spots, item_total, item_type_total
      @items_per_type = []
      @item_types.each do |item_type|
        item_type_total = Event.get_by_date(@date_val+"%")
                          .joins(event_items: [item: :item_type])
                          .where("item_type_id = ?", item_type.id)
                          .select("sum("+@@cost_formula+") as total")
                          .reorder('').first
        @items_per_type <<  Event.get_by_date(@date_val+"%")
                            .joins(event_items: [item: :item_type])
                            .where("item_type_id = ?", item_type.id)
                            .group("item_type_name, item_name, items.id")
                            .order("items.id ASC")
                            .select("item_type_name, item_name, items.id, sum(quantity * days) as spots, sum("+@@cost_formula+") as item_total, #{item_type_total.total} as item_type_total")
      end

      # item types by events: for each item_type, for each event for a given date
        # as:
        # [0] => [item_type_name, event1_total, eventN_total, item_type_total]
        # [1] => [item_type_name, event1_total, eventN_total, item_type_total]
        # ...
      @types_by_events = []
      @item_types.each do |item_type|
        type_by_events = []
        type_by_events << item_type.item_type_name
        @events.each do |event|
          type_by_events << Event.get_by_date(@date_val+"%")
                            .joins(event_items: [item: :item_type])
                            .where("event_items.event_id = ? and item_type_id = ?", event.id, item_type.id)
                            .select("sum("+@@cost_formula+") as total")
                            .reorder('').first.total
        end
        type_by_events << Event.get_by_date(@date_val+"%")
                          .joins(event_items: [item: :item_type])
                          .where("item_type_id = ?", item_type.id)
                          .select("sum("+@@cost_formula+") as total")
                          .reorder('').first.total
        @types_by_events <<  type_by_events
      end

      @chart_start_at = 0
      @chart_end_at = 0
      if @item_type_counts > 0
        @chart_start_at = 4*@item_type_counts+@item_counts+3
        @chart_end_at = @chart_start_at+@item_type_counts-1
      end 

      @report_data_months << {month_short_name: month_name, types_by_events: @types_by_events, events: @events, items_per_type: @items_per_type, item_types: @item_types, total_cost: @total_cost, item_type_counts: @item_type_counts, item_counts: @item_counts, chart_start_at: @chart_start_at, chart_end_at: @chart_end_at}
      
      i += 1

    end 

    # summary and final sheets 

    @date_val = @year

    # total cost 
    @total_cost = Event.total_cost(@date_val+"%")
   
    # cost per item_type for a given date 
      # as: id, item_type_name, total
    @item_types = Event.cost_per_item_type(@date_val+"%") 

    # item type counts                      
    @item_type_counts = @item_types.length 

    # array of item_types names
    @item_types_names = []
    @item_types.each do |item_type|
      @item_types_names << item_type.item_type_name
    end

    @item_counts = EventItem.get_item_count(@date_val+"%")
   
    # for each item_type for a given date 
     # as: item_type_name, item_name, spots, item_total, item_type_total
    @items_per_type = []
    @item_types.each do |item_type|
      item_type_total = Event.get_by_date(@date_val+"%")
                        .joins(event_items: [item: :item_type])
                        .where("item_type_id = ?", item_type.id)
                        .select("sum("+@@cost_formula+") as total")
                        .reorder('').first
      @items_per_type <<  Event.get_by_date(@date_val+"%")
                          .joins(event_items: [item: :item_type])
                          .where("item_type_id = ?", item_type.id)
                          .group("item_type_name, item_name, items.id")
                          .order("items.id ASC")
                          .select("item_type_name, item_name, items.id, sum(quantity * days) as spots, sum("+@@cost_formula+") as item_total, #{item_type_total.total} as item_type_total")
    end

    # item_types by items by months: for each item_type, for each item, for each month for a given date 
      # as:
      # [0] =>  [0] => [item_name, jan_total, ..., dece_total, item_total]
      #         [1] => [item_name, jan_total, ..., dece_total, item_total]
      #         ...
      # [1] =>  [0] => [item_name, jan_total, ..., dece_total, item_total]
      #         [1] => [item_name, jan_total, ..., dece_total, item_total]
      #         ...
      # ...
    @types_by_items_by_months = []
    @monthly_totals_for_types = []

    @item_types.each do |item_type|

      items = Event.get_by_date(@date_val+"%")
              .joins(event_items: [item: :item_type])
              .where("item_type_id = ?", item_type.id)
              .select("item_id, item_name")
              .distinct.order("item_id ASC")

      items_in_type = []

      items.each do |item|

        item_by_months = []
        item_by_months << item.item_name

        @@month_numbers.each do |month_number|
          item_by_months << Event.get_by_date(@date_val+"-"+month_number+"%")
                            .joins(event_items: [item: :item_type])
                            .where("item_type_id = ? and item_id = ?", item_type.id, item.item_id)
                            .select("sum("+@@cost_formula+") as total")
                            .reorder('').first.total
        end
        
        # total 
        item_by_months << Event.get_by_date(@date_val+"%")
                          .joins(event_items: [item: :item_type])
                          .where("item_type_id = ? and item_id = ?", item_type.id, item.item_id)
                          .select("sum("+@@cost_formula+") as total")
                          .reorder('').first.total

        items_in_type << item_by_months

      end

      monthly_totals_for_type = []
      monthly_totals_for_type << "Total"
      @@month_numbers.each do |month_number|
        monthly_totals_for_type <<  Event.get_by_date(@date_val+"-"+month_number+"%")
                                    .joins(event_items: [item: :item_type])
                                    .where("item_type_id = ?", item_type.id)
                                    .select("sum("+@@cost_formula+") as total")
                                    .reorder('').first.total
      end

      #total total 
      monthly_totals_for_type <<  Event.get_by_date(@date_val+"%")
                                  .joins(event_items: [item: :item_type])
                                  .where("item_type_id = ?", item_type.id)
                                  .select("sum("+@@cost_formula+") as total")
                                  .reorder('').first.total

      items_in_type << monthly_totals_for_type
      @types_by_items_by_months << items_in_type
      
      # slice 300.000000 
      @monthly_totals_for_types  << monthly_totals_for_type.slice(1..-2)

    end

    @chart_start_at = 0
    @chart_end_at = 0
    if @item_type_counts > 0
      @chart_start_at = 4*@item_type_counts+@item_counts+5
      @chart_end_at = @chart_start_at+@item_type_counts-1
    end 

    respond_to do |format| 
      format.html {render 'summary_final'}
      format.xlsx {render xlsx: 'summary_final', filename: "summary_final_"+@year.to_s+".xlsx"}
    end  

  end 

  def dashboard

    month_names = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
		
    # how about if last event has dates that span two months e.g. 31 May, 01 Jun
  	last_event = Event.get_all.select(:event_date).order("event_dates.event_date desc").first
  	last_event_date = last_event.event_date
	
    str_year = last_event_date.year.to_s
    str_month = sprintf '%02i', last_event_date.month.to_s
    str_year_month = str_year+"-"+str_month

    month_name = month_names[last_event_date.month-1]
    @month_year = month_name+" "+str_year

    # cost per event for given date 
      # as: id, event_name, total
    @events = Event.cost_per_event(str_year_month+"%")
    
    # events chart data
    # hash {"event_name" => cost, ... "event_name" => cost }
    @event_chart_data = {}
    @events.each do |event|
      @event_chart_data[event.event_name] = event.total
    end

    # cost per item_type for a given date 
      # as: id, item_type_name, total
    @item_types = Event.cost_per_item_type(str_year_month+"%") 

    # item types chart data
    # hash {"item_type_name" => cost, ... "item_type_name" => cost }
    @item_types_chart_data = {}
    @item_types.each do |item_type|
      @item_types_chart_data[item_type.item_type_name] = item_type.total
    end

  end

  private
  # Use callbacks to share common setup or constraints between actions.

  def set_event
    @event = Event.find(params[:id])
  end

end
