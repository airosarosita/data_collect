class AddContentToLessons < ActiveRecord::Migration[7.1]
  def change
    add_column :lessons, :content, :text
  end
end
