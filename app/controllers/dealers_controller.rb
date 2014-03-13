class DealersController < ApplicationController
  before_action :set_dealer, only: [:show, :edit, :update, :destroy]

  # GET /dealers
  # GET /dealers.json
  def index
    @dealers = Dealer.all
  end

  # GET /dealers/1
  # GET /dealers/1.json
  def show
  end

  def admin
     @dealer = Dealer.find(current_user.dealer_id)
  end

  # GET /dealers/new
  def new
    if current_user
      @dealer = Dealer.new
    else
      redirect_to root_path
    end
  end

  # GET /dealers/1/edit
  def edit
  end

  # POST /dealers
  # POST /dealers.json
  def create
    @dealer = Dealer.new(dealer_params)

    respond_to do |format|
      if @dealer.save
        format.html { redirect_to @dealer, notice: 'Dealer was successfully created.' }
        format.json { render action: 'show', status: :created, location: @dealer }
      else
        format.html { render action: 'new' }
        format.json { render json: @dealer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dealers/1
  # PATCH/PUT /dealers/1.json
  def update
    respond_to do |format|
      if @dealer.update(dealer_params)
        format.html { redirect_to @dealer, notice: 'Dealer was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @dealer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dealers/1
  # DELETE /dealers/1.json
  def destroy
    @dealer.destroy
    respond_to do |format|
      format.html { redirect_to dealers_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dealer
      @dealer = Dealer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dealer_params
      params.require(:dealer).permit(:name, :address_1, :address_2, :city,
                                     :state, :zip, :phone_number, :time_zone)
    end
end
