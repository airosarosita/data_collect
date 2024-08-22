class CreateAnswers < ActiveRecord::Migration[7.1]
  def change
    create_table :answers do |t|
      t.belongs_to :questions, null: false, foreign_key: true
      t.text :content, null: false
      t.boolean :is_correct, null: false
    
      t.timestamps
    end
  end
end
