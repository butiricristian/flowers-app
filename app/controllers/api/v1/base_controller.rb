module Api
  module V1
    class BaseController < ApplicationController
      include Pundit::Authorization

      rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

      before_action :authenticate_user!

      private

      def user_not_authorized
        render json: {
          message: "You are not authorized to perform this action"
        }, status: :forbidden
      end
    end
  end
end
