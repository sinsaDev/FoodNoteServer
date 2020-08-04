class Api::ProductsController < Api::ApplicationController
  before_action :token_authentication, except: [:index]
  skip_before_action :verify_authenticity_token

  def create
    begin
      product = @user.products.create! products_params

      #product.product_options.create! product_options_description
      #product.product_videos.create! product_video_params

      params_product = params[:options]
      params_product.each do |k, v|
        product.product_options.create! color: params_product[k]["color"], size: params_product[k]["size"]
        product.product_prices.create! price: params_product[k]["price"]
      end

      if product.save
        render json: ResponseWrap.data_wrap(nil), status: :ok
      else
        render json: ResponseWrap.data_wrap(nil, user_description.errors.details), status: :bad_request
      end
    rescue => e
      render json: ResponseWrap.data_wrap(nil, e.errors.details), status: :bad_request
    end
  end

  def index
    product_list = Product.active_product.all.limit(10)

    if product_list.present?
      render json: ResponseWrap.data_wrap(product_list.as_json), status: :ok
    else
      render json: ResponseWrap.data_wrap(nil), status: :not_found
    end
  end

  def show
    product = Product.find params[:id]
    if product.present?
      render json: ResponseWrap.data_wrap(product.as_json), status: :ok
    else
      render json: ResponseWrap.data_wrap(nil, e.errors.details), status: :bad_request
    end
  end

  private
  def products_params
    params.permit(:name)
  end

  def product_options_description
    params.permit(:color, :size)
  end

  # def product_images_params
  #   params.permit(:seq, :path, :url, :field)
  # end

  # def product_video_params
  #   params.permit(:seq, :path, :url)
  # end
end



## 필요한 api 목록
#  1. 제품 상세 정보 보기 페이지
#  2. 제품 등록 페이지
#  3. 제품 이미지 페이지