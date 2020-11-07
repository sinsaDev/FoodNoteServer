class Admin::CommentsController < Admin::ApplicationController

  def index
    @comments = Comment.all.page params[:page]
  end
end
