class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # has_and_belongs_to_many :roles, join_table: :users_roles
  has_many :articles, dependent: :destroy
  has_many :requests, class_name: 'Ticket', foreign_key: 'user_id', dependent: :destroy
  has_many :tickets,  class_name: 'Ticket', foreign_key: 'moderator_id', dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :marks

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  # validates :password,  presence: true
  # validates :role,      presence: true

  after_create :assign_default_role

  def assign_default_role
    add_role(:user) if roles.blank?
  end
end
