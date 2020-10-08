class Character < ApplicationRecord
  has_many :vehicles
  belongs_to :homeworld
  belongs_to :species

  validates :name, :birth_year, :homeworld, presence: true
end
