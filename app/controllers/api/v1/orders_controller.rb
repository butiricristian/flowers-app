module Api
  module V1
    class OrdersController < BaseController
      def index
        @orders = Order.all.includes(:creator, flowers_orders: [:flower])
        @orders = filter_by_status(params[:status])
        render json: orders_list
      end

      def create
        @order = Order.new(order_params)
        @order.creator = current_user
        if @order.save
          render json: OrderSerializer.new(@order).serialized_json, status: :created
        else
          render json: error_response
        end
      end

      def update
        @order = Order.find(params[:id])
        authorize @order
        if @order.update(order_params)
          render json: OrderSerializer.new(@order).serialized_json, status: :ok
        else
          render json: error_response
        end
      end

      private

      def order_params
        params.require(:order).permit(:status, :address,
                                      flowers_orders_attributes: [:id, :flower_id, :quantity])
      end

      def error_response
        { message: "The order could not be saved: #{@order.errors.full_messages}" }
      end

      def orders_list
        OrderSerializer.new(@orders, include: [:creator, :flowers_orders]).serialized_json
      end

      def filter_by_status(status)
        return @orders if status.blank?

        @orders.where(status:)
      end
    end
  end
end
