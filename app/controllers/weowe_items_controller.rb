class WeoweItemsController < ApplicationController
  before_action :set_weowe_item, only: [:show, :edit, :update, :destroy]

  # GET /weowe_items
  # GET /weowe_items.json
  def index
    @weowe_items = WeoweItem.all
  end

  # GET /weowe_items/1
  # GET /weowe_items/1.json
  def show
  end

  # GET /weowe_items/new
  def new
    @weowe_item = WeoweItem.new
  end

  # GET /weowe_items/1/edit
  def edit
  end

  # POST /weowe_items
  # POST /weowe_items.json
  def create
    @weowe_item = WeoweItem.new(weowe_item_params)

    respond_to do |format|
      if @weowe_item.save
        format.html { redirect_to @weowe_item, notice: 'Weowe item was successfully created.' }
        format.json { render action: 'show', status: :created, location: @weowe_item }
      else
        format.html { render action: 'new' }
        format.json { render json: @weowe_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /weowe_items/1
  # PATCH/PUT /weowe_items/1.json
  def update
    respond_to do |format|
      if @weowe_item.update(weowe_item_params)
        format.html { redirect_to @weowe_item, notice: 'Weowe item was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @weowe_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /weowe_items/1
  # DELETE /weowe_items/1.json
  def destroy
    @weowe_item.destroy
    respond_to do |format|
      format.html { redirect_to weowe_items_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_weowe_item
      @weowe_item = WeoweItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def weowe_item_params
      params[:weowe_item]
    end
end
