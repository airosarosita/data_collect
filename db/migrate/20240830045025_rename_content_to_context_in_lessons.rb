class RenameContentToContextInLessons < ActiveRecord::Migration[7.1]
  def change
    rename_column :lessons, :content, :context
  end
end
