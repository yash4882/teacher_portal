class SessionsController < ApplicationController
	
	def new
	end

	def create
		if teacher = Teacher.authenticate_by(email: params[:email], password: params[:password])
			login teacher
			redirect_to root_path, notice: "You are Signed in Successfully."
		else
			flash[:alert] = "Invalid email or password"
			render :new, status: :unprocessable_entity
		end
	end

	def destroy
		logout current_teacher
		redirect_to root_path, notice: "Successfully logged out."
	end
end