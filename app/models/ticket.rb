class Ticket < ApplicationRecord
  belongs_to :user,       class_name: 'User', inverse_of: 'requests'
  belongs_to :moderator,  class_name: 'User', inverse_of: 'tickets'
end
