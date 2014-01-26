module Api
  module V1
    class TasksController < ApplicationController
      doorkeeper_for :all
      respond_to :json
      def index
        respond_with current_user.tasks
      end

      def create
        respond_with current_user.tasks.create(params[:task])
      end

      private
      def current_user
        @current_user ||= User.find(doorkeeper_token.resource_owner_id)
      end

    end
  end
end
