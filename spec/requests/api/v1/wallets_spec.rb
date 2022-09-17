require 'swagger_helper'

RSpec.describe 'api/v1/wallets', type: :request do

  path '/api/v1/wallets' do

    post('create wallet') do
      tags "Wallets"
      consumes "application/json"
      parameter name: :wallet, in: :body, schema: {
        type: :object,
        properties: {
          account_id: { type: :integer },
        },
        required: ["account_id"],
      }

      response(201, 'successful') do
        
        user = User.first_or_create(user_id: "Felipe Maciel", email: "felipemrvieira@gmail.com", 
          password: "123123", password_confirmation: "123123")
        account = Account.first_or_create(user_id: user.id)

        let(:wallet) { { account_id: account.id } }
        run_test! do |response|
          expect(response).to have_http_status(201)
          expect(response.content_type).to match(a_string_including("application/json"))
          expect(response.body).to include_json(
            account_id: account.id
          )
        end
      end
    end

  end

  path '/api/v1/wallets/{id}' do
    
    get('show wallet') do
      tags "Wallets"
      consumes "application/json"
      parameter name: 'id', in: :path, type: :integer, description: 'id', default: 1

      response(200, 'successful') do

        wallet = Wallet.first_or_create(account_id: Account.last)
        let(:id) { wallet.id }

        run_test! do |response|
          expect(response).to have_http_status(200)
          expect(response.content_type).to match(a_string_including("application/json"))
        end
      end
    end

  end
end
