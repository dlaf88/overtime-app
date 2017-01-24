class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :posts
  has_many :audit_logs
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :phone_number, presence: true,length: {is: 10}
  

  REGEX = /\A[0-9]*\Z/
  validates_format_of :phone_number, with: REGEX
 

  def full_name
	self.first_name + " " + self.last_name
  end 

end
