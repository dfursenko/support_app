class Ticket < ApplicationRecord
  belongs_to :user,       class_name: 'User', inverse_of: 'requests'
  belongs_to :moderator,  class_name: 'User', inverse_of: 'tickets'
  has_many :comments, as: :commentable

  validates :user,      presence: true
  validates :body,      presence: true
  validates :moderator, presence: true
  validates :status,    inclusion: { in: [true, false] }

  def self.indexes(tickets_all, tickets)
    indexes = []
    tickets_all.each_with_index do |ticket, ids|
      indexes << { num: ids + 1, ticket_id: ticket.id }
    end
    indexes.select! do |i|
      result = nil
      tickets.any? {|t| result = t.id == i[:ticket_id]}
      result
    end
    indexes
  end
end
