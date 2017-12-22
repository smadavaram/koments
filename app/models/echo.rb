class Echo < ApplicationRecord
	belongs_to :profile
	acts_as_commentable
end
