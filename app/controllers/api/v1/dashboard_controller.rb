class Api::V1::DashboardController < ApplicationController
  before_action :authenticate_api_v1_user!

  def index
    render json: {
      data: {
        user: current_api_v1_user,
        account: current_api_v1_user.account,
        wallets: current_api_v1_user.account.wallets.map { |w| 
          {
            "id" => w.id, 
            "how_many_coins" => w.coins.count,
            "coins" => w.coin_wallets.map { |cw| 
              { "coin" => cw.coin.name, 
                "acronym" => cw.coin.acronym, 
                "balance" => cw.balance, 
                "dollar_balance" => "xxx",  
              } 
            },
          } 
        }
      }
    }, status: 200
  end

end
