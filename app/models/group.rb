class Group < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :movements, dependent: :destroy

  validates :icon, length: { maximum: 1 }
  validates :icon, numericality: { only_integer: true }
  validates :name, length: { maximum: 30 }
end
