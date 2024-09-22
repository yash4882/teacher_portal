class HomeController < ApplicationController
	def index
		@students = Student.all.page(params[:page]).per(10) 
	end
end
