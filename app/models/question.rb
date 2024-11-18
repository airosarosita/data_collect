class Question < ApplicationRecord
    belongs_to :test
    validates :question, presence: true
    has_rich_text :question
end
