class ItemsController < ApplicationController

  before_action :signed_in_user
  before_action :correct_user
  before_action :not_admin_user # restrict
  before_action :set_item, only: [:edit, :update, :destroy]

  # GET /items
  def index
    @items = Item.all.order(:item_type_id, :item_name).paginate(page: params[:page], per_page: 5)
    params[:page] ? session[:page_no_items_index] = params[:page].to_i : session[:page_no_items_index] = 1
    session[:items_no_items_index] = @items.length 
  end

  # GET /items/new
  def new
    @item = Item.new
  end

  # GET /items/1/edit
  def edit
  end

  # POST /items
  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to items_path, notice: 'Item was successfully created.'
    else
      render :new
    end

  end

  # PATCH/PUT /items/1
  def update
    if @item.update(item_params)
      redirect_to items_path(page: session[:page_no_items_index]), notice: 'Item was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /items/1
  def destroy
    @item.destroy
    page_no_items_index = session[:page_no_items_index]
    items_no_items_index = session[:items_no_items_index]
    if items_no_items_index > 1 
      redirect_to items_url(page: page_no_items_index), notice: 'Item was successfully deleted.'
    elsif page_no_items_index > 1
      redirect_to items_url(page: page_no_items_index-1), notice: 'Item was successfully deleted.' 
    else 
      redirect_to items_url, notice: 'Item was successfully deleted.' 
    end 

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_params
      params.require(:item).permit(:item_name, :cost1_per_unit, :cost2_per_unit, :cost3_per_unit, :item_type_id, :width, :height)
    end
end
