FactoryBot.define do
	factory :post do
		created_at Date.today
		text "TestPost text"
		user # will automatically get the FactoryBot user.
	end

	factory :second_post, class: "Post" do
		created_at Date.yesterday
		text "SecondTestPost text"
		user # will automatically get the FactoryBot second_user.
	end
end