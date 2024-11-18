class AddContentToTests < ActiveRecord::Migration[6.1]
  def change
    add_column :tests, :content, :text
  end
end
