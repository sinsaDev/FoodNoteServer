module CommentsHelper

  def transfer_comments_text(comment)
    if comment.content == "login_success"
      "#{comment.commentable.nickname}님이 로그인을 하였습니다"
    else
    end
  end
end
