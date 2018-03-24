require 'rails_helper'

RSpec.describe Post, type: :model do
	describe "Creation" do 
		before do
			@post = Post.create(created_at: Date.today, text: "My first Post")
		end

		it "can be created" do
			expect(@post).to be_valid
		end

		it "cannot be created without a `created_at` and `text`" do
			@post.created_at = nil
			@post.text = nil
			expect(@post).to_not be_valid
		end
	end
end
