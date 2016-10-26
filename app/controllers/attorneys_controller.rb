class AttorneysController < ApplicationController

	def index
		@attorneys = Attorney.paginate(page: params[:page])
	end

	def show
		@attorney = Attorney.find(params[:id])
	end

	def new 
		@attorney = Attorney.new
	end

	def create
		@attorney = @patient.attorneys.build(attorney_params)
		if @attorney.save
			flash[:info] = "Attorney has been added to the system"
			redirect_to @attorney
		else
			render 'new'
		end
	end

	def edit
		@attorney = Attorney.find(params[:id])
	end

	def update
		@attorney = Attorney.find(params[:id])
		if @attorney.update_attributes(attorney_params)
			flash[:success] = "Attorney Updated"
			redirect_to @attorney
		else
			render 'edit'
		end
	end

	def destroy
		Attorney.find(params[:id]).destroy
		flash[:success] = "Attorney Deleted"
		redirect_to users_url
	end

	private

	def attorney_params
		params.require(:attorney).permit(:name, :firm, :address, :phone, :fax)
	end

end
