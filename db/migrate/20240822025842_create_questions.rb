class CreateQuestions < ActiveRecord::Migration[7.1]
  def change
    create_table :questions do |t|
      t.belongs_to :test, null: false, foreign_key: true
      t.text :content, null: false
      t.integer :weight, null: false
      
      t.timestamps
    end
  end
end
