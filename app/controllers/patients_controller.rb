class PatientsController < ApplicationController

	def index
		@patients = Patient.paginate(page: params[:page])
	end

	def show
		@patient = Patient.find(params[:id])
	end

	def create
		@patient = Patient.new(patient_params)
			if @patient.save
				flash[:info] = "User was added to the system"
				redirect_to root_url
			else
				render 'new'
			end

	end


	def edit
		@patient = Patient.find(params[:id])
	end

	def update
		@patient = Patient.find(params[:id])
		if @patient.update_attributes(patient_params)
			flash[:success] = "User Updated"
			redirect_to @patient
		else
			render 'edit'
		end
	end

	def destroy
		Patient.find(params[:id]).destroy
		flash[:success] = "Patient Deleted"
		redirect_to users_url
	end


end
