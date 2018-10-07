class Article < ApplicationRecord
  belongs_to :user
  belongs_to :category

  validates :user,      presence: true
  validates :category,  presence: true
  validates :title,     presence: true, length: { in: 2..150 }
  validates :published, inclusion: { in: [true, false] }
end
