class CreateContents < ActiveRecord::Migration[7.1]
  def change
    create_table :contents do |t|
      t.string :title
      t.text :content
      t.integer :lesson_id
      t.string :url

      t.timestamps
    end
  end
end
