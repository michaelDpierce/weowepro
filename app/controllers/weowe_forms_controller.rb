class WeoweFormsController < ApplicationController
  before_action :set_weowe_form, only: [:show, :edit, :update, :destroy]

  # GET /weowe_forms
  # GET /weowe_forms.json
  def index
    @weowe_forms = WeoweForm.all
  end

  # GET /weowe_forms/1
  # GET /weowe_forms/1.json
  def show
  end

  # GET /weowe_forms/new
  def new
    @weowe_form = WeoweForm.new
  end

  # GET /weowe_forms/1/edit
  def edit
  end

  # POST /weowe_forms
  # POST /weowe_forms.json
  def create
    @weowe_form = WeoweForm.new(weowe_form_params)

    respond_to do |format|
      if @weowe_form.save
        format.html { redirect_to @weowe_form, notice: 'Weowe form was successfully created.' }
        format.json { render action: 'show', status: :created, location: @weowe_form }
      else
        format.html { render action: 'new' }
        format.json { render json: @weowe_form.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /weowe_forms/1
  # PATCH/PUT /weowe_forms/1.json
  def update
    respond_to do |format|
      if @weowe_form.update(weowe_form_params)
        format.html { redirect_to @weowe_form, notice: 'Weowe form was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @weowe_form.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /weowe_forms/1
  # DELETE /weowe_forms/1.json
  def destroy
    @weowe_form.destroy
    respond_to do |format|
      format.html { redirect_to weowe_forms_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_weowe_form
      @weowe_form = WeoweForm.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def weowe_form_params
      params[:weowe_form]
    end
end
