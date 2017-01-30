class ManagerMailer < ApplicationMailer
	def email manager
		mail(to: manager.email,subject: "Daily Overtime Request.")
	end 
end
