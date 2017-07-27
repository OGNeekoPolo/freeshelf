class Book < ApplicationRecord
  belongs_to :user
  paginates_per 3
  # mount_uploader :image, ImageUploader
end
