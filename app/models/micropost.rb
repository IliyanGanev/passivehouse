class Micropost < ApplicationRecord
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  mount_uploader :picture, PictureUploader
  mount_uploader :attachment, AttachmentUploader
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 2000 }
  validates :tag, presence: true
  validates :attachment, presence: true
  validate :picture_size
  validate :attachment_size

  private

  # Custom validator for the size of an uploaded picture.
  def picture_size
    if picture.size > 5.megabytes 
      errors.add(:picture, "should be less than 5MB")
    end
  end

  def attachment_size
    if picture.size > 20.megabytes 
      errors.add(:attachment, "should be less than 20MB")
    end
  end
end


