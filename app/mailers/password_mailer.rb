class PasswordMailer < ApplicationMailer
	def password_reset
		mail to: params[:teacher].email
	end
end
