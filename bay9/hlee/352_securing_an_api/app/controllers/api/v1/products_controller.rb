module Api
  module V1
    class ProductsController < ApplicationController
      http_basic_authenticate_with name: 'admin', password: 'secret'
      before_filter :restrict_access

      respond_to :json

      def index
        respond_with Product.all
      end

      def show
        respond_with Product.find(params[:id])
      end

      def create
        respond_with Product.create(params[:product])
      end

      def update
        respond_with Product.update(params[:id], params[:product])
      end

      def destroy
        respond_with Product.destroy(params[:id])
      end

      private
      def restrict_access
        api_key = ApiKey.find_by_access_token(params[:access_token])
        head :unauthorized unless api_key
      end
    end
  end
end