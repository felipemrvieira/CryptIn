class OperationService
  def initialize(operation)
    @operation = operation
  end
  
  def make_operation
    puts @operation.valid?
    if @operation.valid?
      origin = Wallet.find(@operation.wallet_origin_id)
      destination = Wallet.find(@operation.wallet_destination_id)
      origin_coin = origin.coin_wallets.where(coin_id: @operation.coin_id).first
      destination_coin = destination.coin_wallets.where(coin_id: @operation.coin_id).first_or_create

      if origin_coin && destination_coin
        origin_coin.balance -= @operation.amount
        destination_coin.balance += @operation.amount

        origin_coin.save
        destination_coin.save
      end

      case @operation.kind
        when "buy"
          destination_account = destination.account
          destination_account.balance += 999 # we need to get this value from a external api
          destination_account.save
        when "sell"
          origin_account = origin.account
          origin_account.balance += 999 # we need to get this value from a external api
          origin_account.save
      end

    end

    @operation
    
  end
end