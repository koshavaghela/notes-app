require 'rails_helper'

RSpec.describe 'Category' do 
	it "should be valid" do
		@category = Category.new(name: 'Sports')
		expect(@category.valid?).to be true
	end
end
