class ImageShout < ActiveRecord::Base
  has_attached_file :image

  has_one :shout, as: :content, dependent: :destroy

  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end
