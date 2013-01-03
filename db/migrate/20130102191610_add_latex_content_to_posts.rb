class AddLatexContentToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :latex_content, :text
  end
end
