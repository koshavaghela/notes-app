class User < ApplicationRecord
	has_secure_password
	
	# save each email object as downcase regardless of user input
	before_save { self.email = email.downcase }

	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

	validate :first_name
	validate :last_name

	validates :email, presence: true, uniqueness: { case_sensitive: false },
																		format: { with: VALID_EMAIL_REGEX }

	has_many :notes, dependent: :destroy

	def full_name
		"#{self.first_name}  #{self.last_name}"
	end
end
 
