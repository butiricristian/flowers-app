require 'swagger_helper'

RSpec.describe 'devise/registrations', type: :request do
  path '/users' do
    post('create registration') do
      user_data = {
        user: {
          email: "butiri.cristian@gmail.com",
          password: "admin1234"
        }
      }

      tags 'Registration'
      description 'Allows a user to sign up'
      consumes 'application/json'
      produces 'application/json'
      parameter name: :user, in: :body, schema: {
        type: :object,
        properties: {
          user: { schema: { "$ref" => "#/components/schemas/user_form" } }
        }
      }

      request_body_example value: user_data, name: 'user_sign_up', summary: 'A user sign up example'

      response(201, 'successful', use_as_request_example: true) do
        let(:user) { user_data }
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
