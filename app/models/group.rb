class Group < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :group_movements
  has_many :movements, through: :group_movements, dependent: :destroy

  validates :icon, numericality: { only_integer: true, less_than: 41, greater_than: 0 }
  validates :name, length: { maximum: 30, message: 'The name is too long' }
  validates :name, presence: { message: 'Please submit a name' }

  def movements_total
    total = 0
    movements.each do |movement|
      total += movement.amount
    end

    total
  end

  def movements_list
    movements.order(created_at: :desc)
  end
end
