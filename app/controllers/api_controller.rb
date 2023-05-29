class ApiController < ApplicationController
  before_action :set_item, only: %i[ show edit update destroy ]
  skip_forgery_protection
  
  # GET /items or /items.json
  def index
    @items = Item.all
    render json: @items
  end

  # GET /items/1 or /items/1.json
  def show
  end

  # GET /items/new
  def new
    @item = Item.new
    render json: @item
  end

  # GET /items/1/edit
  def edit
  end

  # POST /items or /items.json
  def create
    @item = Item.new(item_params)
      if @item.save
        render json: @item, status: :created
      else
        render json: @item.errors, status: :unprocessable_entity
      end
  end

  # PATCH/PUT /items/1 or /items/1.json
  def update
      if @item.update(item_params)
        render json @item, status: :ok
      else
        render json: @item.errors, status: :unprocessable_entity
      end
  end

  # DELETE /items/1 or /items/1.json
  def destroy
    @item.destroy

    respond_to do |format|
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def item_params
      params.permit(:id, :name, :price)
    end
end
