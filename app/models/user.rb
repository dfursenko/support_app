class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  belongs_to :role
  has_many :articles, dependent: :destroy
  has_many :requests, class_name: 'Ticket', foreign_key: 'user_id', dependent: :destroy
  has_many :tickets,  class_name: 'Ticket', foreign_key: 'moderator_id', dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :marks

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  # validates :password,  presence: true
  # validates :role,      presence: true
end
