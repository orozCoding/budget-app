class Movement < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :groups, dependent: :destroy

  validates :name, length: { maximum: 300 }
  validates :amount, numericality: true
end
