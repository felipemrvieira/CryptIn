require "test_helper"

class CoinWalletsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @coin_wallet = coin_wallets(:one)
  end

  test "should get index" do
    get coin_wallets_url, as: :json
    assert_response :success
  end

  test "should create coin_wallet" do
    assert_difference("CoinWallet.count") do
      post coin_wallets_url, params: { coin_wallet: { balance: @coin_wallet.balance, coin_id: @coin_wallet.coin_id, wallet_id: @coin_wallet.wallet_id } }, as: :json
    end

    assert_response :created
  end

  test "should show coin_wallet" do
    get coin_wallet_url(@coin_wallet), as: :json
    assert_response :success
  end

  test "should update coin_wallet" do
    patch coin_wallet_url(@coin_wallet), params: { coin_wallet: { balance: @coin_wallet.balance, coin_id: @coin_wallet.coin_id, wallet_id: @coin_wallet.wallet_id } }, as: :json
    assert_response :success
  end

  test "should destroy coin_wallet" do
    assert_difference("CoinWallet.count", -1) do
      delete coin_wallet_url(@coin_wallet), as: :json
    end

    assert_response :no_content
  end
end
