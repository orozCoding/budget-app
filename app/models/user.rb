class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :movements, foreign_key: 'author_id', dependent: :destroy
  has_many :groups, foreign_key: 'author_id', dependent: :destroy

  validates :first_name, format: { with: /\A[a-zA-Z]+\z/,
                                   message: 'only allows letters' }
  validates :last_name, format: { with: /\A[a-zA-Z]+\z/,
                                  message: 'only allows letters' }
  validates :first_name, length: { maximum: 100 }
  validates :last_name, length: { maximum: 100 }

  def is?(role)
    self.role == role
  end
end
