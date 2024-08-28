class RemoveLanguageFromLessons < ActiveRecord::Migration[7.1]
  def change
    remove_column :lessons, :language, :string
  end
end
