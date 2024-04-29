class PatientsController < AuthBase
  before_action :set_instance, only: %i[ show edit update destroy]
  before_action :check_rights , only: %i[ edit  destroy update create]



  # GET /patients or /patients.json
  def index
    if current_user && current_user.doctor?
         @patients = Patient.where(:user=>current_user&.id)
    elsif current_user && current_user.receptionist?
        @patients=Patient.where(:receptionist_id=>current_user&.id)
    else
      redirect_to new_user_session_path
    end
  end

  # GET /patients/1 or /patients/1.json
  def show
  end

  # GET /patients/new
  def new
    @patient = Patient.new
  end

  # GET /patients/1/edit
  def edit
  end

  # POST /patients or /patients.json
  def create
    @patient = Patient.new(patient_params)

    respond_to do |format|
      if @patient.save
        format.html { redirect_to patient_url(@patient), notice: "Patient was successfully created." }
        format.json { render :show, status: :created, location: @patient }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @patient.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /patients/1 or /patients/1.json
  def update
    respond_to do |format|
      if @patient.update(patient_params)
        format.html { redirect_to patient_url(@patient), notice: "Patient was successfully updated." }
        format.json { render :show, status: :ok, location: @patient }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @patient.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /patients/1 or /patients/1.json
  def destroy
    @patient.destroy!

    respond_to do |format|
      format.html { redirect_to patients_url, notice: "Patient was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_instance
      @patient = Patient.find(params[:id])
      @doctor_name= User.find(@patient.user_id).full_name
      @receptionist= User.find(@patient.receptionist_id).full_name
      @current_user=current_user || nil
    end

    def check_rights
      if current_user && current_user.doctor?
        redirect_to patient_path
      end
    end

    # Only allow a list of trusted parameters through.
    def patient_params
      params.require(:patient).permit(:name, :phone_no, :user_id, :appointment_date, :age,:profile_image ,:receptionist_id)
    end
end

