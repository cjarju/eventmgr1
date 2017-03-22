class ItemTypesController < ApplicationController

  before_action :signed_in_user
  before_action :correct_user
  before_action :not_admin_user # restrict 
  before_action :set_item_type, only: [:edit, :update, :destroy]

  # GET /item_types
  def index
    @item_types = ItemType.all.paginate(page: params[:page], per_page: 5)
    params[:page] ? session[:page_no_item_types_index] = params[:page].to_i : session[:page_no_item_types_index] = 1
    session[:items_no_item_types_index] = @item_types.length 
  end

  # GET /item_types/new
  def new
    @item_type = ItemType.new
  end

  # GET /item_types/1/edit
  def edit
  end

  # POST /item_types
  def create
    @item_type = ItemType.new(item_type_params)
    if @item_type.save
      redirect_to item_types_path, notice: 'Item type was successfully created.'
    else
      render :new
    end

  end

  # PATCH/PUT /item_types/1
  def update
    if @item_type.update(item_type_params)
      redirect_to item_types_path(page: session[:page_no_item_types_index]), notice: 'Item type was successfully updated.'
    else
      render :edit
    end

  end

  # DELETE /item_types/1
  def destroy
    @item_type.destroy
    page_no_item_types_index = session[:page_no_item_types_index]
    items_no_item_types_index = session[:items_no_item_types_index]    
    if items_no_item_types_index > 1 
      redirect_to item_types_url(page: page_no_item_types_index), notice: 'Item type was successfully deleted.'
    elsif page_no_item_types_index > 1
      redirect_to item_types_url(page: page_no_item_types_index-1), notice: 'Item type was successfully deleted.' 
    else 
      redirect_to item_types_url, notice: 'Item type was successfully deleted.' 
    end 
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item_type
      @item_type = ItemType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_type_params
      params.require(:item_type).permit(:item_type_name, :description, :has_dimensions)
    end
end
