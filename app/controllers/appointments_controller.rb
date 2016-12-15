class AppointmentsController < ApplicationController
  
  def index
    @appointments = Appointment.all
  end

  def show
    @appointment = Appointment.find(params[:id])
  end

  def new
    @patient = Patient.find(params[:patient_id])
    @appointment = Appointment.new
  end

  def edit
    @appointment = Appointment.find(params[:id])
  end

  def create
    @patient = Patient.find(params[:patient_id])
    @appointment = @patient.appointments.build(appointment_params)

    respond_to do |format|
      if @appointment.save
        format.html { redirect_to @appointment, notice: 'appointment was successfully created.' }
        format.json { render :show, status: :created, location: @appointment }
      else
        format.html { render :new }
        format.json { render json: @appointment.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @appointment = Appointment.find(params[:id])

    respond_to do |format|
      if @appointment.update(appointment_params)
        format.html { redirect_to @appointment }
        format.json { render :show, status: :ok, location: @appointment }
        flash[:success] = "Appointment Updated"
      else
        format.html { render :edit }
        format.json { render json: @appointment.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    Appointment.find(params[:id]).destroy
    respond_to do |format|
      format.html { redirect_to appointments_url, notice: 'appointment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  
    def appointment_params
      params.require(:appointment).permit(:office, :address, :appointment_type, :status, :start_time, :patient_id)
    end
end