class AddLikesUserIdsToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :likes_user_ids, :text
  end
end
