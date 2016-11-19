class AdjustersController < ApplicationController
	
	def index
		@adjusters = Adjusters.paginate(page: params[:page])
	end

	def show
		@adjuster = Adjuster.find(params[:id])
	end

	def new 
		@adjuster = Adjuster.new
	end

	def create
		@adjuster = @patient.adjusters.build(adjuster_params)
		if @adjuster.save
			flash[:info] = "Adjuster has been added to the system"
			redirect_to @adjuster
		else
			render 'new'
		end
	end

	def edit
		@adjuster = Adjuster.find(params[:id])
	end

	def update
		@adjuster = Adjuster.find(params[:id])
		if @adjuster.update_attributes(adjuster_params)
			flash[:success] = "Adjuster Updated"
			redirect_to @adjuster
		else
			render 'edit'
		end
	end

	def destroy
		Adjuster.find(params[:id]).destroy
		flash[:success] = "Adjuster Deleted"
		redirect_to users_url
	end

	private

	def adjuster_params
		params.require(:adjuster).permit(:name, :agency, :address, :phone, :fax)
	end
end
