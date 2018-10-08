class Article < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :comments, as: :commentable, dependent: :destroy
  has_and_belongs_to_many :tags
  # accepts_nested_attributes_for :tags
  has_many :marks, dependent: :destroy

  validates :user,      presence: true
  validates :category,  presence: true
  validates :title,     presence: true, length: { in: 2..150 }
  validates :published, inclusion: { in: [true, false] }

  def mark(user, article)
    Mark.find_or_create_by user: user, article: article
  end
end
