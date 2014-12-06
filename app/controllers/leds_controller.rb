class LedsController < ApplicationController
#  before_action :set_led, only: [:show, :edit, :update, :destroy, :blink]

  # GET /leds
  # GET /leds.json
	arduino =""
  def index
	end

  def blink
		puts "blink"
		ARDUINO.digital_write 13, true
		sleep 0.3
		ARDUINO.digital_write 13, false
		sleep 0.3
		ARDUINO.digital_write 13, true
		sleep 0.3
		ARDUINO.digital_write 13, false
		redirect_to action: 'index'
  end

  # GET /leds/new
  def new
    @led = Led.new
  end

  # GET /leds/1/edit
  def edit
  end

  # POST /leds
  # POST /leds.json
  def create
    @led = Led.new(led_params)

    respond_to do |format|
      if @led.save
        format.html { redirect_to @led, notice: 'Led was successfully created.' }
        format.json { render :show, status: :created, location: @led }
      else
        format.html { render :new }
        format.json { render json: @led.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /leds/1
  # PATCH/PUT /leds/1.json
  def update
    respond_to do |format|
      if @led.update(led_params)
        format.html { redirect_to @led, notice: 'Led was successfully updated.' }
        format.json { render :show, status: :ok, location: @led }
      else
        format.html { render :edit }
        format.json { render json: @led.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /leds/1
  # DELETE /leds/1.json
  def destroy
    @led.destroy
    respond_to do |format|
      format.html { redirect_to leds_url, notice: 'Led was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_led
      @led = Led.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def led_params
      params[:led]
    end
end
