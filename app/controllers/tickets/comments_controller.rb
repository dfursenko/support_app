class Tickets::CommentsController < CommentsController
  before_action :set_commentable

  private

  def set_commentable
    @commentable = Ticket.find(params[:ticket_id])
  end
end