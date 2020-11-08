class CommentChannel < ApplicationCable::Channel
  def subscribed
    stream_from "all_comments"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
