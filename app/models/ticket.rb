class Ticket < ApplicationRecord
  belongs_to :user,       class_name: 'User', inverse_of: 'requests'
  belongs_to :moderator,  class_name: 'User', inverse_of: 'tickets'

  validates :user,      presence: true
  validates :body,      presence: true
  validates :moderator, presence: true
  validates :status,    inclusion: { in: [true, false] }
end
