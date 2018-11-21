class Article < ApplicationRecord
  has_many :comments, dependent: :destroy
  belongs_to :admin
  validates :title, presence: true, length: { minimum: 5, maximum: 100 }
  validates :text, presence: true, length: { minimum: 5}
end
