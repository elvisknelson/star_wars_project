class Character < ApplicationRecord

  validates :name, :birth_year, :homeworld, presence: true
end
