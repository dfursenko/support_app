class Category < ApplicationRecord
  belongs_to :parent, class_name: 'Category', optional: true
  has_many :children, class_name: 'Category', foreign_key: 'parent_id'
  has_many :articles

  validates :title,     presence: true,   length:       { in: 2..50 }
  validates :level,     presence: true,   numericality: { only_integer: true }
  # validates :parent,    presence: true
  validates :published, inclusion: { in: [true, false] }
end
