require 'swagger_helper'

RSpec.describe 'devise/sessions', type: :request do
  context 'with correct credentials' do
    let!(:existing_user) { create(:user) }

    path '/users/sign_in' do
      post('create session') do
        user_data = {
          user: {
            email: "butiri.cristian@gmail.com",
            password: "admin1234"
          }
        }
        tags 'Login'
        consumes 'application/json'
        produces 'application/json'
        description 'Allows a user to sign into their account'
        parameter name: :user, in: :body, schema: {
          type: :object,
          properties: {
            user: {
              type: :object,
              properties: {
                email: { type: :string },
                password: { type: :string }
              }
            }
          },
          required: [:email, :password]
        }
        request_body_example value: user_data, name: 'user_sign_in', summary: 'A user sign in example'

        response(201, 'successful') do
          let(:user) do
            user_data[:user][:email] = existing_user.email
            user_data[:user][:password] = existing_user.password
            user_data
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

    path '/users/sign_out' do
      delete('delete session') do
        tags 'Login'
        description 'Allows a user to sign out of their account'

        response(204, 'successful') do
          let(:Authorization) { get_bearer(existing_user) }

          after do |example|
            example.metadata[:response][:content] = {
              'application/json' => {
                example: nil
              }
            }
          end
          run_test!
        end
      end
    end
  end
end
