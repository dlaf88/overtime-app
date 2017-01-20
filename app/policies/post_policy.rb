class PostPolicy < ApplicationPolicy

	def update?
		record.user_id == user.id || user.is_a?(AdminUser)		
		##TODO
	end 

end