require 'rails_helper'

describe 'navigate' do
	before do
		# We need a user to log in before we can make any posts.
		@user = FactoryBot.create(:user)
		login_as(@user, :scope=> :user)
	end

	describe 'index' do
		before do
			visit posts_path
		end

		it "can be reached successfully" do
			expect(page.status_code).to eq(200)
		end

		it "has a title of Posts" do
			expect(page).to have_content(/Posts/)
		end

		it "has a list of posts" do
			# Why doesn't this work?
			# post1 = FactoryBot.build_stubbed(:post)
			# post2 = FactoryBot.build_stubbed(:second_post)

			post1 = FactoryBot.create(:post)
			post2 = FactoryBot.create(:second_post)

			visit posts_path
			
			expect(page).to have_content(/TestPost|SecondTestPost/)
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