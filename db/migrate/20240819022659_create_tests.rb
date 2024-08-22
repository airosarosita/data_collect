class CreateTests < ActiveRecord::Migration[7.1]
  def change
    create_table :tests do |t|
      t.integer :time_limit
      t.integer :passing_score

      t.text :description
      t.timestamps
    end
  end
end
