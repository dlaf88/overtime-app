class AuditLogPolicy < ApplicationPolicy
	def index?
		is_admin?
	end 

	def confirm?
		record.user_id == user.id
	end 
	def show?
		is_admin?
	end 
	private 

	def is_admin?
		user.is_a?(AdminUser)
	end 

	def is_user_or_admin?
		record.user_id == user.id || is_admin?
	end 	

end