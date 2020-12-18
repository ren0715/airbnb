class Room < ApplicationRecord
  belongs_to :user
  has_many :photos, dependent: :destroy
  has_many :reservations, dependent: :destroy
  has_many :reviews, through: :reservations

  validates :home_type, presence: true
  validates :room_type, presence: true
  validates :guest_count, presence: true
  validates :bedroom_count, presence: true
  validates :bathroom_count, presence: true

  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  def average_rating
    ids = reservations.pluck(:user_id)# pluck all the user_id from the reservations
    
    # add a condition to return 0 if the reviews from guests is 0
    if reviews.where(user_id: ids).any?
      reviews.where(user_id: ids).average(:rate).round(2).to_i
    else
      return 1
    end
  end

  def guest_reviews
    ids = reservations.pluck(:user_id)
    reviews.where(user_id: ids)
  end
  def host_reviews
    ids = reservations.pluck(:user_id)
    reviews.where.not(user_id: ids)
  end
end
