class Post < ApplicationRecord
	belongs_to :user, optional: true
	validates_presence_of :created_at, :text
end
