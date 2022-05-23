class Group < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :group_movements
  has_many :movements, through: :group_movements

  validates :icon, length: { maximum: 2 }
  validates :icon, numericality: { only_integer: true }
  validates :name, length: { maximum: 30 }

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
