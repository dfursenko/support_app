class User < ApplicationRecord
  belongs_to :role
  has_many :articles
  has_many :requests, class_name: 'Ticket', foreign_key: 'user_id'
  has_many :tickets,  class_name: 'Ticket', foreign_key: 'moderator_id'
end
