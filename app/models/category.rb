class Category < ApplicationRecord
  has_many :talents

  validates :name, presence: true
end

