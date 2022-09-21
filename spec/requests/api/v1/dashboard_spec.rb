require 'swagger_helper'

RSpec.describe 'api/v1/dashboard', type: :request do

  path '/api/v1/dashboard' do
    
    get('show dashboard') do
      tags "Dashboard"
      consumes 'application/json'
      produces 'application/json'
      security [Bearer: {}]
      
      response(200, 'successful') do
        run_test!

        
      end
    end
  end
end
