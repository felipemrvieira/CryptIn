User.create(name: "Felipe Maciel", email: "felipemrvieira@gmail.com", password: "123123", password_confirmation: "123123")
User.create(name: "Thiago Maciel", email: "thiagomrvieira@gmail.com", password: "123123", password_confirmation: "123123")

Account.create(balance: 1000, user_id: User.first.id)
Account.create(balance: 2000, user_id: User.last.id)

Transition.create(amount: 350, account_id: Account.first.id)
Transition.create(amount: 350, account_id: Account.last.id)

Wallet.create(account_id: Account.first.id)
Wallet.create(account_id: Account.first.id)
Wallet.create(account_id: Account.last.id)
Wallet.create(account_id: Account.last.id)

Coin.create(name: "Bitcoin", acronym: "BTC")
Coin.create(name: "Ethereum", acronym: "ETH")
Coin.create(name: "Dogecoin", acronym: "DOGE")
Coin.create(name: "Cardano", acronym: "ADA")

CoinWallet.create(balance: 10, wallet_id: Wallet.first.id, coin_id: Coin.first.id)
CoinWallet.create(balance: 20, wallet_id: Wallet.last.id, coin_id: Coin.first.id)

Operation.create(
    amount: 3, kind: 2, coin_id: Coin.last.id, 
    wallet_origin_id: Wallet.first.id, 
    wallet_destination_id: Wallet.last.id
)
Operation.create(
    amount: 3, kind: 2, coin_id: Coin.last.id, 
    wallet_origin_id: Wallet.last.id, 
    wallet_destination_id: Wallet.first.id
)