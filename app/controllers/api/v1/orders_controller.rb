module Api
  module V1
    class OrdersController < ApplicationController
      def index
        @orders = Order.all
        render json: OrderSerializer.new(@orders).serialized_json
      end

      def create
        @order = Order.new(order_params)
        if @order.save
          render json: OrderSerializer.new(@order).serialized_json, status: :created
        else
          render json: error_response
        end
      end

      def update
        @order = Order.find(params[:id])
        if @order.update(order_params)
          render json: OrderSerializer.new(@order).serialized_json, status: :ok
        else
          render json: error_response
        end
      end

      private

      def order_params
        params.require(:order).permit(:creator_id, :status)
      end

      def error_response
        { message: "The order could not be created: #{@order.errors.full_messages}" }
      end
    end
  end
end
