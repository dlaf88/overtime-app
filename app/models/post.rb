class Post < ApplicationRecord
	enum status: [:submitted,:approved,:rejected]
	belongs_to :user
	validates :date, presence: true
	validates :rationale, presence: true
	validates :overtime_request, presence: true, numericality: {greater_than: 0.00}
	after_save :update_audit_log

	scope :posts_by, ->(user){where(:user_id => user.id)}

	private

	def update_audit_log
		audit_log = AuditLog.where(:user_id => self.user_id, start_date: (self.date - 7.days..self.date)).last 
		#TODO LOOK OVER THIS CODE
		audit_log.confirmed! if audit_log
	end 

	
end
