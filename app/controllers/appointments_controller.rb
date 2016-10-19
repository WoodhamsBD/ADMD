class AppointmentsController < ApplicationController

	def index
		@appointment = Appointment.paginate(page: params[:page])
	end

	def show
		@appointment = Appointment.find(params[:id])
	end

	def create
		@appointment = Appointment.new(appointment_params)
			if @appointment.save
				flash[:info] = "Appointment has been saved."
				redirect_to root_url
			else
				render 'new' # New appointment
			end
	end

	def update
		@appointment = Appointment.find(params[:id])
		if @appointment.update_attributes(appointment_params)
			flash[:success] = "Appointment Updated."
			redirect_to @appointment
		else
			render root_url
    end
  end

	end

  def destroy
    Appointment.find(params[:id]).destroy
    flash[:success] = "Appointment deleted"
    redirect_to root_url
  end

  private

	  def appointment_params
	  	params.require(:title, :office, :address, :type, :status)
	  end


end
