require 'rails_helper'

describe 'navigate' do
	before do
		user = User.create(email: "asdf@asdf.com", password: "asdfasdf", password_confirmation: "asdfasdf",first_name: "John",last_name: "Doe")
		login_as(user, :scope=> :user)
	end

	describe 'index' do
		it "can be reached successfully" do
			visit posts_path
			expect(page.status_code).to eq(200)
		end

		it "has a title of Posts" do
			visit posts_path
			expect(page).to have_content(/Posts/)
		end

		it "has a list of posts" do
			post1 = Post.create(created_at: Date.today, text: "Post1")
			post2 = Post.create(created_at: Date.today, text: "Post2")
			visit posts_path
			expect(page).to have_content(/Post1|Post2/)
		end
	end

	describe 'creation' do
		before do
			visit new_post_path
		end

		it 'has a new form that can be reached' do
			expect(page.status_code).to eq(200)
		end

		it 'can be created from new form page' do
			# Look for a form, and fill it in with this content
			fill_in 'post[created_at]', with: Date.today
			fill_in 'post[text]', with: "Some text"
			click_on "Save"

			expect(page).to have_content("Some text")
		end

		it 'will have a user associated with it' do
			fill_in 'post[created_at]', with: Date.today
			fill_in 'post[text]', with: "User_Association"
			click_on "Save"

			expect(User.last.posts.last.text).to eq("User_Association")
		end
	end
end