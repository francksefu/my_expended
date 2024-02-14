class Group < ApplicationRecord

  belongs_to :user
  has_many :expends

  validates :name, presence: true
  validates :icon, presence: true
end
