module UsersHelper

  def unregister_information(resource)
    if resource.present?
      resource
    else
      "정보 미등록"
    end
  end
end
