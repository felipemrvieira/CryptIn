require 'swagger_helper'

RSpec.describe 'api/v1/transitions', type: :request do
  before(:all) do
    @account = create(:account)
    @transition = create(:transition)
  end

  path '/api/v1/transitions' do

    post('create transition') do
      tags "Transitions"
      consumes "application/json"
      parameter name: :transition, in: :body, schema: {
        type: :object,
        properties: {
          account_id: { type: :integer },
          amount: { type: :decimal },
        },
        required: ["account_id", "amount"],
      }

      response(201, 'successful') do

        let(:transition) { { account_id: @account.id, amount: 1000 } }
        run_test! do |response|
          expect(response).to have_http_status(201)
          expect(response.content_type).to match(a_string_including("application/json"))
          expect(response.body).to include_json(
            account_id: @account.id,
            amount: "1000.0"
          )
        end
      end
    end

    get('list transitions') do
      tags "Transitions"
      produces "application/json"  
      
      response(200, 'successful') do
        schema type: :array,
          items: {
            type: :object,
            properties: {
              id: { type: :integer },
              amount: { type: :string },
              account_id: { type: :integer },
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

  path '/api/v1/transitions/{id}' do
    
    get('show transition') do
      tags "Transitions"
      consumes "application/json"
      parameter name: 'id', in: :path, type: :integer, description: 'id', default: 1

      response(200, 'successful') do

        let(:id) { @transition.id }

        run_test! do |response|
          expect(response).to have_http_status(200)
          expect(response.content_type).to match(a_string_including("application/json"))
        end
      end
    end

  end
end
