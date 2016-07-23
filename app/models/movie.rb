class Movie < ApplicationRecord

  mount_uploader :image, ImageUploader

  has_many :reviews

  validates :title,
    presence: true

  validates :director,
    presence: true

  validates :runtime_in_minutes,
    numericality: { only_integer: true }

  validates :description,
    presence: true

  validates :poster_image_url,
    presence: true

  validates :release_date,
    presence: true

  validate :release_date_is_in_the_past

  scope :title,->(title){where('title LIKE ?', "%#{title}%")}
  scope :director,->(director){where('director LIKE ?', "%#{director}%")}
  scope :search,->(search){where('title LIKE ? OR director LIKE ?', "%#{search}%","%#{search}%")}

  def review_average
    if reviews.size > 0
      return reviews.sum(:rating_out_of_ten)/reviews.size
    else
      return 0
    end
  end

  # def self.title
  #   where('title LIKE ?', "%#{params[:title]}%")
  # end

  # def self.director
  #   where('director LIKE ?', "%#{params[:director]}%")
  # end

  protected

  def release_date_is_in_the_past
    if release_date.present?
      errors.add(:release_date, "should be in the past") if release_date > Date.today
    end
  end
end
