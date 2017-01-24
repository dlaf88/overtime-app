class AuditLogsController < ApplicationController
	def index 
		@audit_logs = AuditLog.all
		authorize(@audit_logs)
	end 

	def show
		@audit_log = AuditLog.find(params[:id])
		authorize(@audit_log)
	end 


end
