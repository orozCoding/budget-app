class Movement < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :group_movements
  has_many :groups, through: :group_movements

  validates :name, length: { maximum: 300 }
  validates :amount, numericality: true
end
