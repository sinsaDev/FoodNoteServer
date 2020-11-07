class Comment < ApplicationRecord
  belongs_to :commentable, polymorphic: true

  enum type: {
      login_success: 0
  }


  def self.enter_admin_page
    create! content: :login_success
  end

end
