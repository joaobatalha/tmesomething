class Setdefaults < ActiveRecord::Migration
  def change
  	change_column_default(:users, :score, 0)
  	change_column_default(:posts, :likes_count, 0)
  end
end
