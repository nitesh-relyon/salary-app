class LeavesController < ApplicationController
  before_action :set_leafe, only: [:edit, :update, :destroy]

  # GET /leaves
  # GET /leaves.json
  def index
    @employees = Employee.all
  end

  # GET /leaves/1
  # GET /leaves/1.json
  def show
    @leaves = Leave.where(:employee_id => params[:id])


  end

  # GET /leaves/new
  def new
    @leafe = Leave.new
  end

  # GET /leaves/1/edit
  def edit
  end

  # POST /leaves
  # POST /leaves.json
  def create
    @leafe = Leave.new(leafe_params)

    respond_to do |format|
      if @leafe.save
        format.html { redirect_to leaves_path}
        format.json { render :show, status: :created, location: @leafe }
      else
        format.html { render :new }
        format.json { render json: @leafe.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /leaves/1
  # PATCH/PUT /leaves/1.json
  def update
    respond_to do |format|
      if @leafe.update(leafe_params)
        format.html { redirect_to @leafe }
        format.json { render :show, status: :ok, location: @leafe }
      else
        format.html { render :edit }
        format.json { render json: @leafe.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /leaves/1
  # DELETE /leaves/1.json
  def destroy
    @leafe.destroy
    respond_to do |format|
      format.html { redirect_to leaves_url }
      format.json { head :no_content }
    end
  end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_leafe
      @leafe = Leave.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def leafe_params
      params.require(:leave).permit(:leave_type, :leave_date, :employee_id, :employee)
    end
end
