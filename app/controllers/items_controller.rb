class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :destroy]

  rescue_from ActiveRecord::RecordInvalid, with: :render_error

  # GET /collection TODO
  # GET /collection.json
  def collection
    @user = find_by_id(params[:id])
    @items = @user.items.decorate

    render :index
  end

  # GET /items
  # GET /items.json
  def index
    if @user = current_user
       @items = @user.items.decorate
    else
       @items = []
    end
  end

  # GET /items/1
  # GET /items/1.json
  def show
  end

  # GET /items/new
  def new
    @item = Item.new
  end

  # POST /items
  # POST /items.json
  def create
    istore = ItemStore.new(item_params, current_user)
    @item = istore.item
    istore.do

    render_success
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    @item.destroy

    render_success
  end

  private

    # Use callbacks to share common setup or constraints between actions.
  def set_item
    @item = Item.find(params[:id]).decorate
  end

    # Never trust parameters from the scary internet, only allow the white list through.
  def item_params
    params.require(:item).permit(:description, :source)
  end

  def render_error
    respond_to do |format|
      format.html { render action_map }
      format.json { render json: @item.errors, status: :unprocessable_entity }
    end
  end

  def render_success
    respond_to do |format|
      format.html { redirect_to @item, notice: t(action_name) }
      format.json { render :show, status: :created, location: @item }
    end
  end

  def action_map
     {
        create: :new,
        update: :edit,
     }[action_name.to_sym] || action_name
  end
end
