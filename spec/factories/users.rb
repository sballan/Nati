FactoryBot.define do
	sequence :email do |n|
		"test_#{n}@test.com"
	end

	factory :user do
		email { generate :email }
		first_name "Jane"
		last_name "Doe"
		password "asdfasdf"
		password_confirmation "asdfasdf"
	end

	factory :user2 do
		email { generate :email }
		first_name "John"
		last_name "Doe"
		password "asdfasdf"
		password_confirmation "asdfasdf"
	end

	factory :admin_user, class: "AdminUser" do
		email { generate :email }
		first_name "Super Jane"
		last_name "Super Doe"
		password "asdfasdf"
		password_confirmation "asdfasdf"
	end
end
