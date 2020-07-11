class Note < ActiveRecord::Base
	
	validates :title, length: { maximum: 30 }
	validates :body, presence: true, length: { maximum: 1000 }

	before_validation :title_and_body

	private

	def title_and_body
		# Returns an error if both a title and body is blank
		return errors.add(:title_and_body, "Title and Body are required") if self.body.blank?

		# If title is blank, returns false and truncates the note's body to 30 characters as default title
		return true unless self.title.blank?
		self.title = body.truncate(30) if title.blank? && body 
	end 
end
