class Admin::InquiriesController < ApplicationController
	before_action :set_inquiry

	def update
		if @inquiry.status == 'yet'
			@inquiry.update(status: 'complete')
			redirect_to admin_root_path
		else
			@inquiry.update(status: 'yet')
			redirect_to admin_root_path
		end
	end

	def destroy
		if @inquiry.destroy!
			redirect_to admin_root_path
		else
			redirect_to admin_root_path
		end
	end

	private

	def status_params
		params.require(:inquiry).permit(:status)
	end

	def set_inquiry
		@inquiry = Inquiry.find(params[:id])
	end

end
