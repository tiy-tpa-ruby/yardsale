class ItemsController < ApplicationController
  before_action :authorize!, except: [:index, :show]

  # GET /items
  def index
    @items = Item.all
  end

  # GET /items/1
  def show
    @item = Item.find(params[:id])
  end

  # GET /items/new
  def new
    @item = Item.new
  end

  # GET /items/1/edit
  def edit
    @item = Item.find(params[:id])
    unless @item.can_this_user_edit?(current_user)
      send_them_back_with_error
      return
    end
  end

  # POST /items
  def create
    @item = Item.new(item_params)
    @item.created_by = current_user

    if @item.save
      redirect_to @item, notice: 'Item was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /items/1
  def update
    @item = Item.find(params[:id])

    unless @item.can_this_user_edit?(current_user)
      send_them_back_with_error
      return
    end

    if @item.update(item_params)
      redirect_to @item, notice: 'Item was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /items/1
  def destroy
    @item = Item.find(params[:id])

    unless @item.can_this_user_destroy?(user)
      send_them_back_with_error
      return
    end

    @item.destroy
    redirect_to items_url, notice: 'Item was successfully destroyed.'
  end

  private

  def send_them_back_with_error
    redirect_to items_path, notice: "You are not allowed"
  end

    # Only allow a trusted parameter "white list" through.
    def item_params
      params.require(:item).permit(:quantity, :quality, :description, :image_url, :price, :serial_number, :purchased_on, :name, :sentimental)
    end
end
