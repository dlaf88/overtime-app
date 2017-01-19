class Post < ApplicationRecord
	enum status: [:submitted,:approved,:rejected]
	belongs_to :user
	validates :date, presence: true
	validates :rationale, presence: true

	
end
