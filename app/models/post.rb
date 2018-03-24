class Post < ApplicationRecord
	validates_presence_of :created_at, :text
end
