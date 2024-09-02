class AddImageToContents < ActiveRecord::Migration[7.1]
  def change
    add_column :contents, :image, :string
  end
end
