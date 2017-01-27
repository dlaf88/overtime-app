class StaticController < ApplicationController
	def homepage
		if current_user.is_a? AdminUser
			@pending_approvals = Post.where(:status => 'submitted')
			@audit_logs = AuditLog.last(10)
		else
			@audit_logs = AuditLog.where(:user_id => current_user.id, status: 'pending')
		end
		
	end 
end 