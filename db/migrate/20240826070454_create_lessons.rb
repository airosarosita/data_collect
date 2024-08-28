class CreateLessons < ActiveRecord::Migration[7.1]
  def change
    create_table :lessons do |t|
      t.belongs_to :users, null: false, foreign_key: true
      t.string :title, null: false
      t.string :language, null: false
    
      t.timestamps
    end
  end
end
