require 'swagger_helper'

RSpec.describe 'api/v1/coins', type: :request do

  path '/api/v1/coins' do

    get('list coins') do
      tags "Coins"
      produces "application/json"  
      
      response(200, 'successful') do
        schema type: :array,
          items: {
            type: :object,
            properties: {
              id: { type: :integer },
              name: { type: :string },
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
    
    post('create coin') do
      tags "Coins"
      consumes "application/json"
      parameter name: :coin, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string },
        },
        required: ["name"],
      }

      response(201, 'successful') do
        let(:coin) { { name: 'Crypto' } }
        
        run_test! do |response|
          expect(response).to have_http_status(201)
          expect(response.content_type).to match(a_string_including("application/json"))
          expect(response.body).to include_json(
            name: 'Crypto'
          )
        end

      end

    end

  end
end
