class FillinPdfForm
	attr_writer :template_path
	attr_reader :attributes

	def initialize
		fill_out
	end

	def export(output_file_path=nil)
		output_path = output_file_path
end