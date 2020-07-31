class Api::ProductsController < Api::ApplicationController
  before_action :token_authentication

  def create
    @user.user_description.create! user: @user
    UserDescription.create!(user_params)
  end

  private
  def products_params
    params.permit(:address, :gender, :phone, :grade)
  end
end



## 필요한 api 목록
#  1. 제품 상세 정보 보기 페이지
#  2. 제품 등록 페이지
#  3. 제품 이미지 페이지