require 'rails_helper'

RSpec.describe Note, type: :model do
	it "displays an error message when both title and body are empty" do
		user = create(:user) 
		note = Note.new(user: user, title: nil, body: nil)
		
		expect(note).to_not be_valid
	end

	it "defaults the title to first 30 characters of the body if title is missing" do
		body = "This is the body."
		note = create(:note, title: nil, body: body)

		expect(note.title).to eq body.truncate(30)
	end
end
