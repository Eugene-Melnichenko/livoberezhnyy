class Article < ApplicationRecord
  has_many :comments, dependent: :destroy
  validates :title, presence: true, length: { minimum: 5, maximum: 100 }
  validates :text, presence: true, length: { minimum: 5}
end
