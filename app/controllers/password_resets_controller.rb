class PasswordResetsController < ApplicationController

	before_action :set_teacher_by_token, only: [:edit, :update]

	def new
	end

	def create
		if (teacher = Teacher.find_by(email: params[:email]))
			PasswordMailer.with(
				teacher: teacher,
				token: teacher.generate_token_for(:password_reset)
			).password_reset.deliver_later
		end
		redirect_to root_path, notice: "Check email to reset your password"
	end

	def edit
	end

	def update
		if @teacher.update(password_params)
			redirect_to new_session_path, notice: "Your password reset successfully now you can login"
		else
			render :edit, status: :unprocessable_entity
		end
	end

	private

	def set_teacher_by_token
		@teacher = Teacher.find_by_token_for(:password_reset, params[:token])
		redirect_to new_password_reset_path alert: "Invalid Token" unless @teacher.present?
	end

	def password_params
		params.require(:teacher).permit(:password, :password_confirmation)
	end
end