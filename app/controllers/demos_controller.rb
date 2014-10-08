class DemosController < ApplicationController
  before_action :set_demo, only: [:show, :edit, :update, :destroy]

  def index
    @demos = Demo.all
  end

  def show
  end

  def new
    @demo = Demo.new
  end

  def edit
  end

  def create
    @demo = Demo.new(demo_params)

    respond_to do |format|
      if @demo.save
        format.html { redirect_to landing_page_path, notice: 'Thank you, we will be in contact soon.' }
        format.json { render action: 'show', status: :created, location: @demo }
      else
        format.html { render action: 'new' }
        format.json { render json: @demo.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @demo.update(demo_params)
        format.html { redirect_to @demo, notice: 'Demo was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @demo.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @demo.destroy
    respond_to do |format|
      format.html { redirect_to demos_url }
      format.json { head :no_content }
    end
  end

  private

  def set_demo
    @demo = Demo.find(params[:id])
  end

  def demo_params
    params.require(:demo).permit(:first_name, :last_name, :phone_number, :email, :dealership)
  end
end
