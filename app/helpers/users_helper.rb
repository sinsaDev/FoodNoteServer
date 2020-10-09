module UsersHelper

  def unregister_information(resource)
    if resource.present?
      resource
    else
      "정보 미등록"
    end
  end

  def label_for_user_status(user)
    if user.present?
      if user.status["not_phone_certified"]
        content_tag(:span, "추가정보필요", class: ["badge bg-warning my-auto"])
      elsif user.status["unregister"]
        content_tag(:span, "회원탈퇴", class: ["badge bg-danger my-auto"])
      elsif user.status["sign_up"]
        content_tag(:span, "회원", class: ["badge bg-success my-auto"])
      else
        content_tag(:span, "상태없음", class: ["badge bg-secondary my-auto"])
      end
    else
      content_tag(:span, "유저정보없음", class: ["badge bg-secondary my-auto"])
    end
  end

 def label_for_sns(user)
   if user.present?
     if user.kakao?
       content_tag(:span, "카카오", class: ["badge bg-warning my-auto"])
     elsif user.facebook?
       content_tag(:span, "네이버", class: ["badge bg-primary my-auto"])
     elsif user.naver?
       content_tag(:span, "네이버", class: ["badge bg-success my-auto"])
     else
       content_tag(:span, "상태없음", class: ["badge bg-secondary my-auto"])
     end
   else
     content_tag(:span, "유저정보없음", class: ["badge bg-secondary my-auto"])
   end
 end

end
