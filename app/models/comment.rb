class Comment < ApplicationRecord
  belongs_to :commentable, polymorphic: true

  enum type: {
      login_success: 0
  }

  after_create_commit do |comment|
    CommentJob.perform_later comment
  end


  def self.enter_admin_page
    create! content: :login_success
  end
end
