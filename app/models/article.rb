class Article < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :comments, as: :commentable
  has_and_belongs_to_many :tags
  accepts_nested_attributes_for :tags

  validates :user,      presence: true
  validates :category,  presence: true
  validates :title,     presence: true, length: { in: 2..150 }
  validates :published, inclusion: { in: [true, false] }
end
