class EchosController < ApplicationController
  before_action :authenticate_profile!, :except => [:index, :show]
  before_action :set_echo, only: [:show, :edit, :update, :destroy]

  # GET /echos
  # GET /echos.json
  def index
    @echos = Echo.all
  end

  # GET /echos/1
  # GET /echos/1.json
  def show
    @echo           = Echo.find(params[:id])
    @new_comment    = Comment.build_from(@echo, current_profile.id, "")
  end

  # GET /echos/new
  def new
    @echo = Echo.new
  end

  # GET /echos/1/edit
  def edit
  end

  # POST /echos
  # POST /echos.json
  def create
    
     @echo = current_profile.echos.build(echo_params)

    respond_to do |format|
      if @echo.save
        format.html { redirect_to @echo, notice: 'Echo was successfully created.' }
        format.json { render :show, status: :created, location: @echo }
      else
        format.html { render :new }
        format.json { render json: @echo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /echos/1
  # PATCH/PUT /echos/1.json
  def update
    respond_to do |format|
      if @echo.update(echo_params)
        format.html { redirect_to @echo, notice: 'Echo was successfully updated.' }
        format.json { render :show, status: :ok, location: @echo }
      else
        format.html { render :edit }
        format.json { render json: @echo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /echos/1
  # DELETE /echos/1.json
  def destroy
    @echo.destroy
    respond_to do |format|
      format.html { redirect_to echos_url, notice: 'Echo was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_echo
      @echo = Echo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def echo_params
      params.require(:echo).permit(:headline, :body)
    end
end
