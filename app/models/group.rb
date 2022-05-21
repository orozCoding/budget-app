class Group < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :group_movements
  has_many :movements, through: :group_movements


  validates :icon, length: { maximum: 1 }
  validates :icon, numericality: { only_integer: true }
  validates :name, length: { maximum: 30 }
end
