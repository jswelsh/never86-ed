class LiquorsController < ApplicationController
  before_action :set_liquor, only: [:show, :edit, :update, :destroy]

  # GET /liquors
  # GET /liquors.json
  def index
    @liquors = Liquor.all
  end

  # GET /liquors/1
  # GET /liquors/1.json
  def show
  end

  # GET /liquors/new
  def new
    @liquor = Liquor.new
  end

  # GET /liquors/1/edit
  def edit
  end

  # POST /liquors
  # POST /liquors.json
  def create
    @liquor = Liquor.new(liquor_params)

    respond_to do |format|
      if @liquor.save
        format.html { redirect_to @liquor, notice: 'Liquor was successfully created.' }
        format.json { render :show, status: :created, location: @liquor }
      else
        format.html { render :new }
        format.json { render json: @liquor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /liquors/1
  # PATCH/PUT /liquors/1.json
  def update
    respond_to do |format|
      if @liquor.update(liquor_params)
        format.html { redirect_to @liquor, notice: 'Liquor was successfully updated.' }
        format.json { render :show, status: :ok, location: @liquor }
      else
        format.html { render :edit }
        format.json { render json: @liquor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /liquors/1
  # DELETE /liquors/1.json
  def destroy
    @liquor.destroy
    respond_to do |format|
      format.html { redirect_to liquors_url, notice: 'Liquor was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_liquor
      @liquor = Liquor.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def liquor_params
      params.require(:liquor).permit(:spirit, :brand, :name, :capacity, :cost)
    end
end
