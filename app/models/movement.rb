class Movement < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :group_movements
  has_many :groups, through: :group_movements

  validates :name, length: { maximum: 300, message: 'The name is too long' }
  validates :name, presence: { message: 'Please submit a name' }
  validates :group_ids, presence: { message: 'Please select at least one category' }
  validates :amount, presence: { message: 'Please submit an amount' }
  validates :amount, numericality: true
end
