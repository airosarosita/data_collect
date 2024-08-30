class Lesson < ApplicationRecord
    has_many :contents, dependent: :destroy
    belongs_to :user
    has_rich_text :content
    has_one_attached :file
end
