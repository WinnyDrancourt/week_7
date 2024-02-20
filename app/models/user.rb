class User < ApplicationRecord
  after_create :welcome_send

  has_many :attentances
  has_many :attended_events, through: :attentances, source: :event
  has_many :hosted_events, foreign_key: 'admin_id', class_name: 'Event'

  # Validates
  validates :email, presence: true, uniqueness: true

  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
