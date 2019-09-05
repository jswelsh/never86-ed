class BottleReadingsController < ApplicationController
  before_action :require_login
  before_action :set_bottle_reading, only: [:show, :edit, :update, :destroy]

  # GET /bottle_readings
  # GET /bottle_readings.json
  def index
    @bottle_readings = BottleReading.all
  end

  # GET /bottle_readings/1
  # GET /bottle_readings/1.json
  def show
  end

  # GET /bottle_readings/new
  def new
    @bottle_reading = BottleReading.new
  end

  #DON'T NEED FOR DEMO
  # GET /bottle_readings/1/edit
  # def edit
  # end

  # POST /bottle_readings
  # POST /bottle_readings.json
  def create
    @bottle_reading = BottleReading.new(bottle_reading_params)

    respond_to do |format|
      if @bottle_reading.save
        format.html { redirect_to @bottle_reading, notice: 'Bottle reading was successfully created.' }
        format.json { render :show, status: :created, location: @bottle_reading }
      else
        format.html { render :new }
        format.json { render json: @bottle_reading.errors, status: :unprocessable_entity }
      end
    end
  end

  #DON'T NEED FOR DEMO
  # PATCH/PUT /bottle_readings/1
  # PATCH/PUT /bottle_readings/1.json
  # def update
  #   respond_to do |format|
  #     if @bottle_reading.update(bottle_reading_params)
  #       format.html { redirect_to @bottle_reading, notice: 'Bottle reading was successfully updated.' }
  #       format.json { render :show, status: :ok, location: @bottle_reading }
  #     else
  #       format.html { render :edit }
  #       format.json { render json: @bottle_reading.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # DELETE /bottle_readings/1
  # DELETE /bottle_readings/1.json
  def destroy
    @bottle_reading.destroy
    respond_to do |format|
      format.html { redirect_to bottle_readings_url, notice: 'Bottle reading was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bottle_reading
      @bottle_reading = BottleReading.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bottle_reading_params
      params.require(:bottle_reading).permit(:bottle_id, :user_id, :fill, :reading_time)
    end
end
