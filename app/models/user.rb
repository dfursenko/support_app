class User < ApplicationRecord
  belongs_to :role
  has_many :articles
  has_many :requests, class_name: 'Ticket', foreign_key: 'user_id'
  has_many :tickets,  class_name: 'Ticket', foreign_key: 'moderator_id'
  has_many :comments
  has_many :marks

  validates :email,     presence: true, uniqueness: true
  validates :password,  presence: true
  validates :role,      presence: true
end
