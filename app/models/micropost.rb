class Micropost < ActiveRecord::Base
  belongs_to :user
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 140 }
  validate :picture_size
  mount_uploader :picture, PictureUploader
  default_scope -> { order(created_at: :desc) }
  
  private
  
    # Validates the size of an uploaded picture.
    def picture_size
      if picture.size > 2.megabytes
        errors.add(:picture, "should be less than 2 MB")
      end
    end
end
