class Review < ApplicationRecord
  belongs_to :reservation
  validates :content, presence: true
end
