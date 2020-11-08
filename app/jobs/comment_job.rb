class CommentJob < ApplicationJob
  queue_as :default

  def perform(comment)
    html = ApplicationController.renderer.render partial: "/admin/comments/comment", locals: {comment: comment}
    CommentChannel.broadcast_to "all_comment", { html: html }
  end
end
