class Expend < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :group

  validates :name, presence: true
  validates :amount, numericality: {great_than_or_equal_to: 0}
  validates :author_id, presence: true
end
