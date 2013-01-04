class Post < ActiveRecord::Base

  CATEGORIES = ['Physics', 'Math', 'Chemistry', 'Biology']
  belongs_to :user
  attr_accessible :image_url, :title, :user_id, :author, :likes_count, :id, :likes_user_ids, :latex_content, :category
  serialize :likes_user_ids
  before_save :set_defaults

  private
    def set_defaults
      self.likes_user_ids ||= []
    end
end
