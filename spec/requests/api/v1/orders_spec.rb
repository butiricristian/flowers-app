require 'swagger_helper'

RSpec.describe 'api/v1/orders', type: :request do
  context 'with signed_in user' do
    let(:user) { create(:user) }
    let(:Authorization) { get_bearer(user) }
    let!(:flowers) { create_list(:flower, 2) }
    let!(:initial_order) { create(:order, creator: user) }
    let!(:flowers_order) do
      create(:flowers_order, order_id: initial_order.id, flower_id: flowers.first.id, quantity: 1)
    end

    path '/api/v1/orders' do
      get('list orders') do
        tags 'Orders'
        security [bearer_auth: []]
        consumes 'application/json'
        produces 'application/json'
        parameter name: :status,
                  in: :query,
                  description: "Filter by order status",
                  schema: { type: :string, enum: %w[pending delivered canceled] }

        response(200, 'successful') do
          after do |example|
            example.metadata[:response][:content] = {
              'application/json' => {
                example: JSON.parse(response.body, symbolize_names: true)
              }
            }
          end
          run_test! do |response|
            expect(JSON.parse(response.body)['data']).not_to eq([])
          end
        end

        response(200, 'successful') do
          let(:order) { create(:order, status: :delivered) }
          let(:status) { 'pending' }

          after do |example|
            example.metadata[:response][:content] = {
              'application/json' => {
                example: JSON.parse(response.body, symbolize_names: true)
              }
            }
          end
          run_test! do |response|
            expect(JSON.parse(response.body)['data']).to eq([])
          end
        end
      end

      post('create order') do
        order_data = {
          order: {
            status: 'pending',
            address: Faker::Address.full_address,
            flowers_orders_attributes: [
              { flower_id: 1, quantity: 1 },
              { flower_id: 2, quantity: 2 }
            ]
          }
        }

        tags 'Orders'
        security [bearer_auth: []]
        description 'Allows the user to create an order.'
        consumes 'application/json'
        produces 'application/json'
        parameter name: :order, in: :body, schema: {
          type: :object,
          properties: {
            order: { "$ref" => "#/components/schemas/order_form" }
          }
        }

        request_body_example value: order_data, name: 'order', summary: 'An order example'
        response(201, 'successful') do
          let(:order) do
            order_data[:order][:flowers_orders_attributes][0][:flower_id] = flowers.first.id
            order_data[:order][:flowers_orders_attributes][1][:flower_id] = flowers.second.id
            order_data
          end

          after do |example|
            example.metadata[:response][:content] = {
              'application/json' => {
                example: JSON.parse(response.body, symbolize_names: true)
              }
            }
          end
          run_test!
        end
      end
    end

    path '/api/v1/orders/{id}' do
      parameter name: 'id', in: :path, type: :integer, description: 'id'

      patch('update order') do
        order_data = {
          order: {
            status: 'delivered',
            address: Faker::Address.full_address,
            flowers_orders_attributes: [
              { id: 1, flower_id: 1, quantity: 2 }
            ]
          }
        }

        tags 'Orders'
        security [bearer_auth: []]
        description 'Allows the user to update an order. Only the creator of the order can update it.'
        consumes 'application/json'
        produces 'application/json'
        parameter name: :order, in: :body, schema: {
          type: :object,
          properties: {
            order: { "$ref" => "#/components/schemas/order_form" }
          }
        }

        request_body_example value: order_data, name: 'order', summary: 'An order example'
        response(200, 'successful') do
          let(:order) do
            order_data[:order][:flowers_orders_attributes][0][:id] = flowers_order.id
            order_data[:order][:flowers_orders_attributes][0][:flower_id] = flowers.first.id
            order_data
          end
          let(:id) { initial_order.id }

          after do |example|
            example.metadata[:response][:content] = {
              'application/json' => {
                example: JSON.parse(response.body, symbolize_names: true)
              }
            }
          end
          run_test!
        end
      end
    end
  end
end
