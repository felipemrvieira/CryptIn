class Api::V1::CoinWalletsController < ApplicationController
  before_action :set_coin_wallet, only: %i[ show update destroy ]

  # GET /coin_wallets
  def index
    @coin_wallets = CoinWallet.all

    render json: @coin_wallets
  end

  # GET /coin_wallets/1
  def show
    render json: @coin_wallet
  end

  # POST /coin_wallets
  def create
    @coin_wallet = CoinWallet.new(coin_wallet_params)

    if @coin_wallet.save
      render json: @coin_wallet, status: :created, location: @coin_wallet
    else
      render json: @coin_wallet.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /coin_wallets/1
  def update
    if @coin_wallet.update(coin_wallet_params)
      render json: @coin_wallet
    else
      render json: @coin_wallet.errors, status: :unprocessable_entity
    end
  end

  # DELETE /coin_wallets/1
  def destroy
    @coin_wallet.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_coin_wallet
      @coin_wallet = CoinWallet.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def coin_wallet_params
      params.require(:coin_wallet).permit(:balance, :coin_id, :wallet_id)
    end
end
