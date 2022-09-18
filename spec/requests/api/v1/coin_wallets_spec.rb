require 'swagger_helper'

RSpec.describe '/api/v1/coin_wallets', type: :request do
  before(:all) do
    @coin = create(:coin)
    @wallet = create(:wallet)
    @coin_wallet = create(:coin_wallet)
  end


  path '/api/v1/coin_wallets' do

    post('create coin_wallet') do
      tags "CoinWallet"
      consumes "application/json"
      parameter name: :coin_wallet, in: :body, schema: {
        type: :object,
        properties: {
          wallet_id: { type: :integer },
          coin_id: { type: :integer },
        },
        required: ["wallet_id", "coin_id"],
      }

      response(201, 'successful') do
        
       

        let(:coin_wallet) { { wallet_id: @wallet.id, coin_id: @coin.id } }
        run_test! do |response|
          expect(response).to have_http_status(201)
          expect(response.content_type).to match(a_string_including("application/json"))
          expect(response.body).to include_json(
            coin_id: @coin.id,
            wallet_id: @wallet.id,
          )
        end
      end
    end

    get('list coin_wallets') do
      tags "CoinWallet"
      produces "application/json"  
      
      response(200, 'successful') do
        schema type: :array,
          items: {
            type: :object,
            properties: {
              id: { type: :integer },
              balance: { type: :string },
              coin_id: { type: :integer },
              wallet_id: { type: :integer },
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

  path '/api/v1/coin_wallets/{id}' do
    
    get('show coin_wallet') do
      tags "CoinWallet"
      consumes "application/json"
      parameter name: 'id', in: :path, type: :integer, description: 'id', default: 1

      response(200, 'successful') do

        let(:id) { @coin_wallet.id }

        run_test! do |response|
          expect(response).to have_http_status(200)
          expect(response.content_type).to match(a_string_including("application/json"))
        end
      end
    end

  end
end
