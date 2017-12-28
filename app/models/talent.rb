class Talent < ApplicationRecord
  include PgSearch

  pg_search_scope :global_search,
    against: [:description, :talent_proposed],
    associated_against: {
      user: [ :first_name, :last_name, :address, :email ],
      category: [ :name ]
    }

  belongs_to :category
  belongs_to :user

  validates :talent_proposed, presence: true
  validates :description, presence: true
end
