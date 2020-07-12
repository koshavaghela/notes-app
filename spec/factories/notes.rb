FactoryBot.define do
	factory :note do
		association :user
		title { "New Note" }
		body { "This is the body of a note" }
	end
end
