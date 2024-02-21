class Event < ApplicationRecord
  after_create :event_send
  belongs_to :admin, class_name: 'User'
  has_many :attentances
  has_many :stripe_customers, through: :attentances, source: :user

  # Validates
  validates :title, presence: true, length: { minimum: 5, maximum: 140 }
  validates :start_date, presence: true
  validate :start_date_cannot_be_in_the_past
  validates :duration, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validate :duration_multiple_of_five
  validates :description, presence: true, length: { minimum: 20, maximum: 1000 }
  validates :location, presence: true
  validates :price, presence: true,
                    numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 1000 }

  def start_date_cannot_be_in_the_past
    errors.add(:start_date, 'Please choose a future date') if start_date.present? && start_date < Date.today
  end

  def duration_multiple_of_five
    errors.add(:duration, 'Must be a multiple of five') unless (duration % 5).zero?
  end

  def event_send
    EventMailer.event_email(self).deliver_now
  end
end
