class LinkdumpsController < ApplicationController
  before_action :set_linkdump, only: [:show, :edit, :update, :destroy]

  # GET /linkdumps
  # GET /linkdumps.json
  def index
    @linkdumps = Linkdump.all.limit(100)
  end

  # GET /linkdumps/1
  # GET /linkdumps/1.json
  def show
  end

  # GET /linkdumps/new
  def new
    @linkdump = Linkdump.new
  end

  # GET /linkdumps/1/edit
  def edit
  end

  # POST /linkdumps
  # POST /linkdumps.json
  def create
    @linkdump = Linkdump.new(linkdump_params)

    respond_to do |format|
      if @linkdump.save
        format.html { redirect_to @linkdump, notice: 'Linkdump was successfully created.' }
        format.json { render :show, status: :created, location: @linkdump }
      else
        format.html { render :new }
        format.json { render json: @linkdump.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /linkdumps/1
  # PATCH/PUT /linkdumps/1.json
  def update
    respond_to do |format|
      if @linkdump.update(linkdump_params)
        format.html { redirect_to @linkdump, notice: 'Linkdump was successfully updated.' }
        format.json { render :show, status: :ok, location: @linkdump }
      else
        format.html { render :edit }
        format.json { render json: @linkdump.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /linkdumps/1
  # DELETE /linkdumps/1.json
  def destroy
    @linkdump.destroy
    respond_to do |format|
      format.html { redirect_to linkdumps_url, notice: 'Linkdump was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_linkdump
      @linkdump = Linkdump.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def linkdump_params
      params.require(:linkdump).permit(:url)
    end
end
