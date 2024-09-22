class PasswordsController < ApplicationController
	before_action :authenticate_teacher!

	def edit
	end

	def update
		if current_teacher.update(password_params)
			redirect_to root_path, notice: "Your password updated successfully"
		else
			render :edit, status: :unprocessable_entity
		end
	end

	private

	def password_params
		params.require(:teacher).permit(:password, :password_confirmation, :password_challenge).with_defaults(password_challenge: "")
	end
end