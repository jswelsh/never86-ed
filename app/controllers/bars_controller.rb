class BarsController < ApplicationController
  before_action :require_login
  before_action :set_bar, only: [:show, :edit, :update, :destroy]

  # GET /bars
  # GET /bars.json
  def index
    @bars = current_user.bars.all
  end

  # GET /bars/1
  # GET /bars/1.json
  def show
    redirect_to bar_bottles_path(@bar)
  end

  # GET /bars/new
  def new
    @bar = Bar.new
  end

  #Not needed for DEMO
  # GET /bars/1/edit
  # def edit
  # end

  # POST /bars
  # POST /bars.json
  def create
    #Will not work with multiple organizations per user
    @bar = current_user.bars.new(bar_params)

    respond_to do |format|
      if @bar.save
        format.html { redirect_to @bar, notice: 'Bar was successfully created.' }
        format.json { render :show, status: :created, location: @bar }
      else
        format.html { render :new }
        format.json { render json: @bar.errors, status: :unprocessable_entity }
      end
    end
  end

  # NOT NEEDED FOR DEMO
  # PATCH/PUT /bars/1
  # PATCH/PUT /bars/1.json
  # def update
  #   respond_to do |format|
  #     if @bar.update(bar_params)
  #       format.html { redirect_to @bar, notice: 'Bar was successfully updated.' }
  #       format.json { render :show, status: :ok, location: @bar }
  #     else
  #       format.html { render :edit }
  #       format.json { render json: @bar.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # DELETE /bars/1
  # DELETE /bars/1.json
  def destroy
    @bar.destroy
    respond_to do |format|
      format.html { redirect_to bars_url, notice: 'Bar was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bar
      @bar = current_user.bars.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bar_params
      params.require(:bar).permit(:name)
    end
end
