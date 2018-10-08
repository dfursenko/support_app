class Comment < ApplicationRecord
  belongs_to :commentable, polymorphic: true
  belongs_to :user

  validates :user, presence: true
  validates :commentable_type, presence: true
  validates :commentable_id, presence: true
  validates :body, presence: true
  validates :body, inclusion: false
end
