class Company < ApplicationRecord

  validates :email, :phone, presence: true

end