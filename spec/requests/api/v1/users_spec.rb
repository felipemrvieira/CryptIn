require 'swagger_helper'

RSpec.describe 'api/v1/auth', type: :request do

    path '/api/v1/auth' do

        post('create user') do
            tags 'User'
            consumes 'application/json'
            parameter name: :user, in: :body, schema: {
                type: :object,
                properties: {
                name: { type: :string, default: "Felipe Maciel" },
                email: { type: :string,  default: "felipemrvieira@gmail.com" },
                password: { type: :string, default: 123123 },
                },
                required: ['name', 'email', 'password'],
            }

            response(200, 'ok') do
                let(:user) { { name: 'Felipe Maciel', email: "felipemrvieira@gmail.com", password: 123123 } }
                
                User.destroy_all

                run_test! do |response|
                    expect(response).to have_http_status(200)
                    expect(response.content_type).to match(a_string_including('application/json'))
                    expect(response.body).to include_json(
                        name: 'Felipe Maciel'
                    )
                end


            end

        end

    end
    
    path '/api/v1/auth/sign_in' do

        post('login user') do
            tags 'User'
            consumes 'application/json'
            parameter name: :user, in: :body, schema: {
                type: :object,
                properties: {
                email: { type: :string,  default: "felipemrvieira@gmail.com" },
                password: { type: :string, default: 123123 },
                },
                required: ['email', 'password'],
            }

            response(200, 'ok') do
                User.create(name: "Felipe Maciel", email: "felipemrvieira2@gmail.com", 
                  password: "123123", password_confirmation: "123123")
               
                let(:user) { { name: "Felipe Maciel", email: "felipemrvieira2@gmail.com", password: 123123 } }

                run_test! do |response|
                    expect(response).to have_http_status(200)
                    expect(response.content_type).to match(a_string_including('application/json'))
                    expect(response.body).to include_json(
                        email: 'felipemrvieira2@gmail.com'
                    )
                end

            end

        end

    end
end
