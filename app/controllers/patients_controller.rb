class PatientsController < ApplicationController
	helper_method :sort_column, :sort_direction

	def index
		if params[:search]
			@patients = Patient.search(params[:search]).paginate(page: params[:page], :per_page => 20)
		else
			@patients = Patient.paginate(page: params[:page],:per_page => 20)
		end
	end

	def show
		@patient = Patient.find(params[:id])
		@attorneys = @patient.attorneys.paginate(page: params[:page])
		@adjusters = @patient.adjusters.paginate(page: params[:page])
		@appointments = @patient.appointments.paginate(page: params[:page])
	end

	def new
		@patient = Patient.new
		@patient.attorneys.build
		@patient.adjusters.build
	end

	def create
		@patient = Patient.new(patient_params)
			if @patient.save
				flash[:info] = "Patient was added to the system"
				redirect_to @patient
			else
				render 'new'
			end
	end

	def edit
		@patient = Patient.find(params[:id])
		@attorneys = @patient.attorneys
		@adjusters = @patient.adjusters
	end

	def update
		@patient = Patient.find(params[:id])
		@attoryneys = @patient.attorneys
		if @patient.update_attributes(patient_params)
			flash[:success] = "Patient Updated"
			redirect_to @patient
		else
			render 'edit'
		end
	end

	def destroy
		Patient.find(params[:id]).destroy
		flash[:success] = "Patient Deleted"
		redirect_to patients_url
	end

	# Template Specific Actions for routing

	def appointment_confirmation
		@patient = Patient.find(params[:patient_id])
		@applicant_attorney = @patient.attorneys.where("attorney_type = 'Applicant'")
		@defense_attorney = @patient.attorneys.where("attorney_type = 'Defense'")

		respond_to do |format|
      format.docx { headers["Content-Disposition"] = "attachment; filename=\"appointment_confirmation.docx\"" }
    end
	end


	def depo_invoice
		@patient = Patient.find(params[:patient_id])
		@applicant_attorney = @patient.attorneys.where("attorney_type = 'Applicant'")
		@defense_attorney = @patient.attorneys.where("attorney_type = 'Defense'")
		@depo_appointment = @patient.appointments.where("appointment_type = 'Deposition'")
		
		respond_to do |format|
      format.docx { headers["Content-Disposition"] = "attachment; filename=\"depo_invoice.docx\"" }
    end
	end

	def depo_confirmation
		@patient = Patient.find(params[:patient_id])
		@applicant_attorney = @patient.attorneys.where("attorney_type = 'Applicant'")
		@defense_attorney = @patient.attorneys.where("attorney_type = 'Defense'")
		@depo_appointment = @patient.appointments.where("appointment_type = 'Deposition'")

		respond_to do |format|
      format.docx { headers["Content-Disposition"] = "attachment; filename=\"depo_confirmation.docx\"" }
    end
	end

	def action_items
		@patient = Patient.find(params[:patient_id])

		respond_to do |format|
      format.docx { headers["Content-Disposition"] = "attachment; filename=\"action_items.docx\"" }
    end
	end


	private

	def patient_params
		params.require(:patient).permit(:name, :interpreter, :street_address, :city, :state, :zip_code, :phone, :ssn, :dob, :date_of_injury, :report_type, :employer, :claim_number, :panel_number, :wcab_number, :notes, 
			attorneys_attributes: [:id, :name, :firm, :address, :phone, :fax],
			adjusters_attributes: [:id, :name, :agency, :address, :phone, :fax])
	end

	def attorney_params
		params.require(:patient).permit(:name, :firm, :address, :phone, :fax)
	end

	def sort_column
		Patient.columns.include?(params[:sort]) ? params[:sort] : "name"
	end

	def sort_direction
		%w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
	end

end
