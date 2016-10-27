class PatientsController < ApplicationController

	def index
		if params[:search]
			@patients = Patient.search(params[:search]).paginate(page: params[:page])
		else
			@patients = Patient.paginate(page: params[:page])
		end
	end

	def show
		@patient = Patient.find(params[:id])
		@attorneys = @patient.attorneys.paginate(page: params[:page])
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
	end

	def update
		@patient = Patient.find(params[:id])
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


	private

	def patient_params
		params.require(:patient).permit(:name, :address, :phone, :ssn, :dob, :employer, :claim_number, :panel_number, :wcab_number, :notes, attorneys_attributes: [:name, :firm, :address, :phone, :fax], adjusters_attributes: [:name, :agency, :address, :phone, :fax])
	end


end
