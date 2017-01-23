class Post < ApplicationRecord
	enum status: [:submitted,:approved,:rejected]
	belongs_to :user
	validates :date, presence: true
	validates :rationale, presence: true
	validates :overtime_request, presence: true, numericality: {greater_than: 0.00}

	scope :posts_by, ->(user){where(:user_id => user.id)}

	
end
