class RegistrationsController < ApplicationController
	def new
		@teacher = Teacher.new
	end

	def create
		@teacher = Teacher.new(registration_params)
		if @teacher.save
			login @teacher
			redirect_to home_index_path
		else
			render :new, status: :unprocessable_entity
		end
	end

	private

	def registration_params
		params.require(:teacher).permit(:name, :email, :password, :password_confirmation)
	end
end