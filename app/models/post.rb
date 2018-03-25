class Post < ApplicationRecord
	belongs_to :user
	validates_presence_of :created_at, :text
end
