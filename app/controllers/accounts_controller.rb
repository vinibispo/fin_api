class AccountsController < ApplicationController
  before_action :set_account, only: %i[show update destroy]
  def create
    @account = Account.new(account_params)
    if @account.save
      render :show, status: :created
    else
      render json: @account.errors, status: :unprocessable_entity
    end
  end

  def show; end

  def update
    if @account.update(update_account_params)
      render :show, status: :ok
    else
      render json: @account.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @account.destroy
  end

  private

  def account_params
    params.require(:account).permit(:name, :cpf)
  end

  def update_account_params
    params.require(:account).permit(:name)
  end

  def set_account
    @account = Account.find_by(id: params[:id])
    render json: { message: 'Account not found' }, status: :not_found unless @account.present?
  end
end
