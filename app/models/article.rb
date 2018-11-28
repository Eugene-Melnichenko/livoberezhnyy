class Article < ApplicationRecord
  belongs_to :admin
  validates :title, presence: true, length: { minimum: 5, maximum: 100 }
  validates :text, presence: true, length: { minimum: 5}

  mount_uploader :image, ImageUploader
end
