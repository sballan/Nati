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

	describe 'new' do
		it 'has a link from the homepage' do
			visit root_path
			# This we click the link with this id
			click_link("new_post_from_nav")
			expect(page.status_code).to eq(200)
		end
	end

	describe 'delete' do
		it 'can be deleted' do
			@post = FactoryBot.create(:post)
			visit posts_path 

			click_link("delete_post_#{@post.id}_from_index")
			expect(page.status_code).to eq(200)
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

	describe 'edit' do
		before do
			@post = FactoryBot.create(:post)
		end

		it 'can be reached by clicking `edit` on index page' do
			visit posts_path
			# Find the link to click on by passing the element id we're looking for.  In _post.html.erb we set the id of the link we want to click on to include the id of our post, we use that here.
			click_link "edit_#{@post.id}"
			expect(page.status_code).to eq(200)
		end

		it 'can be edited' do
			visit edit_post_path(@post)

			# Look for a form, and fill it in with this content
			fill_in 'post[created_at]', with: Date.today
			fill_in 'post[text]', with: "Edited this text"
			click_on "Save"

			expect(page).to have_content("Edited this text")
		end
	end

end