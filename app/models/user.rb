class User < ApplicationRecord
  enum membership: { Standard: 0, Premium: 1 }

  validates :email, uniqueness: true
  validates :username, uniqueness: true
  before_create :set_username

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :chat_rooms, dependent: :destroy
  has_many :messages, dependent: :destroy

  private

  def set_username
    self.username = self.email.split('@')[0]
  end

end
