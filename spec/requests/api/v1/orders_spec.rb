require 'swagger_helper'

RSpec.describe 'api/v1/orders', type: :request do
  path '/api/v1/orders' do
    get('list orders') do
      tags 'Orders'
      response(200, 'successful') do
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

    post('create order') do
      order_data = {
        order: {
          created_by_id: 1,
          status: 'pending'
        }
      }

      tags 'Orders'
      description 'Allows the user to create an order.'
      consumes 'application/json'
      produces 'application/json'
      parameter name: :order, in: :body, schema: {
        type: :object,
        properties: {
          order: { schema: { "$ref" => "#/components/schemas/order" } }
        }
      }

      request_body_example value: order_data, name: 'order', summary: 'An order example'
      response(200, 'successful') do
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
          created_by_id: 1,
          status: 'pending'
        }
      }

      tags 'Orders'
      description 'Allows the user to update an order. Only the creator of the order can update it.'
      consumes 'application/json'
      produces 'application/json'
      parameter name: :order, in: :body, schema: {
        type: :object,
        properties: {
          order: { schema: { "$ref" => "#/components/schemas/order" } }
        }
      }

      request_body_example value: order_data, name: 'order', summary: 'An order example'
      response(200, 'successful') do
        let(:id) { '1' }

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

    put('update order') do
      tags 'Orders'
      response(200, 'successful') do
        let(:id) { '123' }

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
