class PostPolicy < ApplicationPolicy


	def update?
		return true if is_admin?
		return true if is_user_or_admin? && record_not_approved		
		##TODO
	end 

	private 

	def is_admin?
		user.is_a?(AdminUser)
	end 

	def is_user_or_admin?
		record.user_id == user.id || is_admin?
	end 

	def record_not_approved
		!record.approved?
	end 

end