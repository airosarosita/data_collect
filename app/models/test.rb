class Test < ApplicationRecord
  belongs_to :lesson
  has_many :questions
  has_one_attached :image
end
