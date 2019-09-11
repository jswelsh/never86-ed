class BottlesController < ApplicationController
 # before_action :require_login
  before_action :set_bar
  before_action :set_bottle, only: [:show, :edit, :update, :destroy]

  # GET /bottles
  # GET /bottles.json
  def index
    @bottles = @bar.bottles.all
  end

  # GET /bottles/1
  # GET /bottles/1.json
  def show
    @bottle = Bottle.find params[:id]
  end

  # GET /bottles/new
  def new
    @bottle = @bar.bottles.new
  end

  # GET /bottles/1/edit
  def edit
  end

  # POST /bottles
  # POST /bottles.json
  def create
    @bottle = @bar.bottles.new(bottle_params)

    respond_to do |format|
      if @bottle.save
        format.html { redirect_to bar_bottles_path(@bar), notice: 'Bottle was successfully created.' }
        format.json { render :show, status: :created, location: bar_bottles_path(@bar) }
      else
        format.html { render :new }
        format.json { render json: @bottle.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bottles/1
  # PATCH/PUT /bottles/1.json
  def update
    respond_to do |format|
      if @bottle.update(bottle_params)
        format.html { redirect_to @bottle, notice: 'Bottle was successfully updated.' }
        format.json { render :show, status: :ok, location: @bottle }
      else
        format.html { render :edit }
        format.json { render json: @bottle.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bottles/1
  # DELETE /bottles/1.json
  def destroy
    @bottle.destroy
    respond_to do |format|
      format.html { redirect_to bottles_url, notice: 'Bottle was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
 #current_user.
  private
    def set_bar
      @bar = Bar.find(params[:bar_id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_bottle
      # @bottle = @bar.bottles.find(params[:id])
      @bottle = Bottle.first
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bottle_params
      params.require(:bottle).permit(:liquor_id)
    end
end
