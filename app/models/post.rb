class Post < ActiveRecord::Base
	belongs_to :user
  attr_accessible :image_url, :title, :user_id
end
