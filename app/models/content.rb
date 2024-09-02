class Content < ApplicationRecord
    belongs_to :lesson
    has_rich_text :body
    has_one_attached :image
end
