require 'swagger_helper'

RSpec.describe 'api/v1/accounts', type: :request do

  path '/api/v1/accounts' do

    post('create account') do
      tags "Accounts"
      consumes "application/json"
      parameter name: :account, in: :body, schema: {
        type: :object,
        properties: {
          user_id: { type: :integer },
        },
        required: ["user_id"],
      }

      response(201, 'successful') do
        
        user = User.first_or_create(name: "Felipe Maciel", email: "felipemrvieira3@gmail.com", 
          password: "123123", password_confirmation: "123123")

        let(:account) { { user_id: user.id } }
        run_test! do |response|
          expect(response).to have_http_status(201)
          expect(response.content_type).to match(a_string_including("application/json"))
          expect(response.body).to include_json(
            user_id: user.id
          )
        end
      end
    end

  end

  path '/api/v1/accounts/{id}' do
    
    get('show account') do
      tags "Accounts"
      consumes "application/json"
      parameter name: 'id', in: :path, type: :integer, description: 'id', default: 1

      response(200, 'successful') do

        account = Account.first_or_create(user_id: User.last)
        let(:id) { account.id }

        run_test! do |response|
          expect(response).to have_http_status(200)
          expect(response.content_type).to match(a_string_including("application/json"))
        end
      end
    end

  end
end
