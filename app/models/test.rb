class Test < ApplicationRecord
  has_many :questions
  has_one_attached :image
end
