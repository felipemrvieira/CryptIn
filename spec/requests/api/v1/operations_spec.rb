require 'swagger_helper'

RSpec.describe '/api/v1/operations', type: :request do

  path '/api/v1/operations' do

    post('create operation') do
      tags "Operation"
      consumes "application/json"
      parameter name: :operation, in: :body, schema: {
        type: :object,
        properties: {
          amount: { type: :integer },
          kind: { type: :integer },
          wallet_origin_id: { type: :integer },
          wallet_destination_id: { type: :integer },
          coin_id: { type: :integer },
        },
        required: ["wallet_id", "coin_id"],
      }

      response(201, 'successful') do
        
        user = User.first_or_create(user_id: "Felipe Maciel", email: "felipemrvieira@gmail.com", 
          password: "123123", password_confirmation: "123123")
        account = Account.first_or_create(user_id: user.id)
        wallet_origin = Wallet.create(account_id: account.id)
        wallet_destination = Wallet.create(account_id: account.id)
        coin = Coin.first_or_create(name: "Bitcoin")


        let(:operation) { { wallet_origin_id: wallet_origin.id, wallet_destination_id: wallet_destination.id, 
          coin_id: coin.id, amount: 1, kind: 2 } }
        run_test! do |response|
          expect(response).to have_http_status(201)
          expect(response.content_type).to match(a_string_including("application/json"))
          expect(response.body).to include_json(
            coin_id: coin.id,
            wallet_origin_id: wallet_origin.id, 
            wallet_destination_id: wallet_destination.id,
            amount: "1.0", 
            kind: 2
          )
        end
      end
    end

    get('list operations') do
      tags "Operation"
      produces "application/json"  
      
      response(200, 'successful') do
        schema type: :array,
          items: {
            type: :object,
            properties: {
              id: { type: :integer },
              kind: { type: :integer },
              amount: { type: :string },
              coin_id: { type: :integer },
              wallet_origin_id: { type: :integer },
              wallet_destination_id: { type: :integer },
              created_at: { type: :datetime},
              updated_at: { type: :datetime}
            }
          }
          run_test! do |response|
            expect(response).to have_http_status(200)
            expect(response.content_type).to match(a_string_including("application/json"))
            expect(response.body).to include_json(
              []
            )
          end
      end
    end

  end

  path '/api/v1/operations/{id}' do
    
    get('show operation') do
      tags "Operation"
      consumes "application/json"
      parameter name: 'id', in: :path, type: :integer, description: 'id', default: 1

      response(200, 'successful') do

        operation = Operation.first_or_create(wallet_origin_id: Wallet.first, 
          wallet_destination_id: Wallet.last, coin_id: Coin.last)
        let(:id) { operation.id }

        run_test! do |response|
          expect(response).to have_http_status(200)
          expect(response.content_type).to match(a_string_including("application/json"))
        end
      end
    end

  end
end
