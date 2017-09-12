class Chat < ApplicationRecord

  belongs_to :user
  belongs_to :group

  validates :text_or_image, presence: true
  validates :group_id, presence: true
  validates :user_id, presence: true

  mount_uploader :image, ImageUploader

  private
  def text_or_image
    text.presence || image.presence
  end

end
